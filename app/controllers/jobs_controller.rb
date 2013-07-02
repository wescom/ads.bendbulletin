class JobsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin, :only => [:index, :edit, :update, :destroy]

  def index
    jobs = Job
    jobs = jobs.where(:user_id => params[:user_id]) if params[:user_id].present?
    @jobs = jobs.paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @upload_type = UploadType.find_by_id(params[:upload_job_id])
    @job = Job.new
    @job.startdate = Time.now
    10.times {@job.job_files.build}
    @global_settings = GlobalSettings.all
  end

  def create
    @global_settings = GlobalSettings.all
    if params[:cancel_button]
      redirect_to root_path
    else
      @job = Job.new(params[:job])
      @job.user_id = current_user.id
      @upload_type = UploadType.find_by_id(@job.upload_type_id)
      if @job.save
        JobMailer.job_uploaded_notification(@upload_type,@job).deliver
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
