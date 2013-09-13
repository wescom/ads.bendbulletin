class JobFilesController < ApplicationController

  def index
    @job_files = JobFile.find(:all)
  end

  def new
    @job_file = JobFile.new
    @job = Job.find(params[:job_id])
  end

  def create
    @job_file = JobFile.new(params[:job_file])
    if params[:cancel_button]
      redirect_to job_path(@job_file.job_id)
    else
      if @job_file.save
        flash[:notice] = "job_file Created"
        redirect_to job_path(@job_file.job_id)
      else
        flash[:error] = "job_file Creation Failed"
        render :action => :new
      end
    end    
  end
  
  def destroy
    @job_file = JobFile.find(params[:id])
    if @job_file.destroy
      flash[:notice] = "job_file Deleted"
      redirect_to job_files_path
    else
      flash[:error] = "job_file Deletion Failed"
      redirect_to job_files_path
    end
  end
end
