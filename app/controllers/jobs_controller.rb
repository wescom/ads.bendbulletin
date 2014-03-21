class JobsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin, :only => [:edit, :update, :destroy]
  before_filter :require_edit_or_admin, :only => [:index]

  def index
    # Returns all jobs in database
    @jobs = Job
    @jobs = @jobs.where('name LIKE ? or company LIKE ?', "%#{params[:search_query]}%", "%#{params[:search_query]}%") if params[:search_query].present?
    @jobs = @jobs.paginate(:page => params[:page], :per_page => 20, :order => 'created_at DESC')
  end

  def myjobs
    jobs = Job
    # Display specific user if specified, otherwise display current users jobs
    if params[:user_id].nil?
      jobs = jobs.where(:user_id => current_user.id) unless current_user.nil?
    else
      jobs = jobs.where(:user_id=>params[:user_id])
    end
    @jobs = jobs.paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
  end

  def show
    @job = Job.find(params[:id])
    if @job.user_id != current_user.id and !((current_user.has_role? :edit) or (current_user.has_role? :admin))
      redirect_to myjobs_path
    end
  end

  def new
    if params[:upload_job_id].nil?
      redirect_to root_path
    end
    @upload_type = UploadType.find_by_id(params[:upload_job_id])
    @job = Job.new
    @job.startdate = Time.now
    10.times {@job.job_files.build}
    @global_settings = GlobalSettings.all
  end

  def create
    @global_settings = GlobalSettings.all
    @current_user = current_user
    if params[:cancel_button]
      redirect_to root_path
    else
      @job = Job.new(params[:job])
      @job.user_id = current_user.id
      @upload_type = UploadType.find_by_id(@job.upload_type_id)
      if @job.save
        Notification.job_uploaded_notification(@upload_type,@job).deliver
        Confirmation.confirmation_new_job(@upload_type,@job,@current_user.email).deliver
        if @job.email != @current_user.email
          Confirmation.confirmation_new_job(@upload_type,@job,@job.email).deliver
        end
        flash[:notice] = "Job Created"
        redirect_to root_path
      else
        # retain selected files if save fails
        (10 - @job.job_files.size).times { @job.job_files.build }
        flash[:error] = "Job Creation Failed"
        render :action => :new
      end
    end    
  end
  
  def edit
  end

  def update
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      flash[:notice] = "Job Killed!"
      redirect_to jobs_path
    else
      flash[:error] = "Job Deletion Failed"
      redirect_to jobs_path
    end
  end
end
