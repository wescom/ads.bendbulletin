class Notification < ActionMailer::Base
  default :from => "no-reply@utility.wescompapers.com"

  # New job uploaded to database
  def job_uploaded_notification(upload_type,job)
    @upload_type = upload_type
    @job = job

    recipient = upload_type.email_recipient
    subject = "Files have been uploaded to ads.bendbulletin.com"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
#      format.text
    end
  end

  # New job_file added to a job
  def new_job_file_notification(job_file,upload_type)
    @upload_type = upload_type
    @job_file = job_file

    recipient = upload_type.email_recipient
    subject = "New Job File Uploaded"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
  end

  # New worked file added to a job
  def new_worked_file_notification(job_file,upload_type)
    @upload_type = upload_type
    @job_file = job_file

    recipient = job_file.job.email
    subject = "New Worked File Uploaded"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
  end

  # New proof added to a job
  def new_proof_file_notification(job_file,upload_type)
    @upload_type = upload_type
    @job_file = job_file

    recipient = job_file.job.email
    subject = "New Proof Uploaded"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
  end
end
