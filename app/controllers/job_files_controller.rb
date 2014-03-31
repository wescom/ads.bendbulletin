class JobFilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_edit_or_admin, :only => [:index, :destroy]
  
  def index
    @job_files = JobFile.find(:all)
  end

  def new
    @job_file = JobFile.new
    @job = Job.find(params[:job_id])
  end

  def create
    @job_file = JobFile.new(params[:job_file])
    @confirmation_email_text = EmailText.find_by_name_and_email_type('Upload New File', 'confirmation')
    @notification_email_text = EmailText.find_by_name_and_email_type('Upload New File', 'notification')
    @current_user = current_user

    if params[:cancel_button]
      redirect_to job_path(@job_file.job_id)
    else
      @upload_type = UploadType.find_by_id(@job_file.job.upload_type_id)
      if @job_file.save
        Notification.new_job_file_notification(@job_file,@upload_type,@notification_email_text).deliver if @job_file.file_type == "job_file"
        Notification.new_worked_file_notification(@job_file,@upload_type,@notification_email_text).deliver if @job_file.file_type == "worked_file"
        Notification.new_proof_file_notification(@job_file,@upload_type,@notification_email_text).deliver if @job_file.file_type == "proof_file"
        Confirmation.confirmation_new_job_file(@job_file,@upload_type,@current_user.email,@confirmation_email_text).deliver if @job_file.file_type == "job_file"
        Confirmation.confirmation_new_worked_file(@job_file,@upload_type,@current_user.email,@confirmation_email_text).deliver if @job_file.file_type == "worked_file"
        Confirmation.confirmation_new_proof_file(@job_file,@upload_type,@current_user.email,@confirmation_email_text).deliver if @job_file.file_type == "proof_file"
        flash[:notice] = "File Upload"
        redirect_to job_path(@job_file.job_id)
      else
        flash[:error] = "File Upload Failed"
        redirect_to new_job_file_path(params[:job_file])
      end
    end    
  end

  def destroy
    @job_file = JobFile.find(params[:id])
    @job = @job_file.job
    if @job_file.destroy
      flash[:notice] = "File Deleted"
      redirect_to job_path(@job)
    else
      flash[:error] = "File Deletion Failed"
      redirect_to job_path(@job)
    end
  end

  def download
    @current_user = current_user
    @job_file = JobFile.find(params[:job_file_id])
    if (@job_file.job.user_id == @current_user.id) or (@current_user.has_role? :edit) or (@current_user.has_role? :admin)
      send_file @job_file.file.path
    else
      redirect_to job_path(@job_file.job_id)
    end
  end

  def approve
    @current_user = current_user
    @job_file = JobFile.find(params[:job_file_id])
    @job_file.approved = true unless @job_file.nil?
    @job_file.approved_at = Time.now unless @job_file.nil?
    @confirmation_email_text = EmailText.find_by_name_and_email_type('Proof Approved', 'confirmation')
    @notification_email_text = EmailText.find_by_name_and_email_type('Proof Approved', 'notification')
    @upload_type = UploadType.find_by_id(@job_file.job.upload_type_id)

    if @job_file.save
      Notification.proof_approved_notification(@job_file,@upload_type,@notification_email_text).deliver if @job_file.file_type == "proof_file"
      Confirmation.confirmation_proof_approved(@job_file,@upload_type,@current_user.email,@confirmation_email_text).deliver if @job_file.file_type == "proof_file"
      flash[:notice] = "Proof Approved"
      redirect_to job_path(@job_file.job_id)
    else
      flash[:error] = "Proof Approval Failed"
      redirect_to new_job_file_path(params[:job_file])
    end
  end
end
