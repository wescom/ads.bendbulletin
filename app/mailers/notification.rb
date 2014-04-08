class Notification < ActionMailer::Base
  default :from => "adsmail@adsmail.bendbulletin.com"

  # New job uploaded to database
  def job_uploaded_notification(upload_type,job,email_text)
    @upload_type = upload_type
    @job = job
    @email_text = email_text

    recipient = upload_type.email_recipient
    subject = "Files have been uploaded to ads.bendbulletin.com"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
#      format.text
    end
    Rails.logger.info "*** Notification Sent ***"
  end

  # New job_file added to a job
  def new_job_file_notification(job_file,upload_type,email_text)
    @upload_type = upload_type
    @job_file = job_file
    @email_text = email_text

    recipient = upload_type.email_recipient
    subject = "New Job File Uploaded"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
    Rails.logger.info "*** Notification Sent ***"
  end

  # New worked file added to a job
  def new_worked_file_notification(job_file,upload_type,email_text)
    @upload_type = upload_type
    @job_file = job_file
    @email_text = email_text

    recipient = job_file.job.email
    subject = "New Worked File Uploaded"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
    Rails.logger.info "*** Notification Sent ***"
  end

  # New proof added to a job
  def new_proof_file_notification(job_file,upload_type,email_text)
    @upload_type = upload_type
    @job_file = job_file
    @email_text = email_text

    recipient = job_file.job.email
    subject = "New Proof Uploaded"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
    Rails.logger.info "*** Notification Sent ***"
  end

  # Proof Approved
  def proof_approved_notification(job_file,upload_type,email_text)
    @upload_type = upload_type
    @job_file = job_file
    @email_text = email_text

    recipient = upload_type.email_recipient
    subject = "Proof Approved"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
    Rails.logger.info "*** Notification Sent ***"
  end
end
