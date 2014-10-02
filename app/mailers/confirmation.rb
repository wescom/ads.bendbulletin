class Confirmation < ActionMailer::Base
  default :from => "adsmail@adsmail.bendbulletin.com"

  # Welcome email when registering
  def confirmation_new_register(user)
    @user = user
    recipient = @user.email
    @email_text = EmailText.find_by_name_and_email_type('Registration Welcome', 'confirmation')
    
    subject = "Welcome to Ads.BendBulletin.com"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
    Rails.logger.info "*** Confirmation Sent ***"
  end

  # New job uploaded to database
  def confirmation_new_job(upload_type,job,recipient,email_text)
    @upload_type = upload_type
    @job = job
    @email_text = email_text

    subject = "Ads.BendBulletin.com Confirmation - Job #"+@job.id.to_s
    mail(:to => recipient, :subject => subject) do |format|
      format.html
#      format.text
    end
    Rails.logger.info "*** Confirmation Sent ***"
  end

  # New job_file added to a job
  def confirmation_new_job_file(job_file,upload_type,recipient,email_text)
    @upload_type = upload_type
    @job_file = job_file
    @email_text = email_text

    subject = "Ads.BendBulletin.com Confirmation - New File Uploaded for Job #"+@job_file.job.id.to_s
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
    Rails.logger.info "*** Confirmation Sent ***"
  end

  # New worked file added to a job
  def confirmation_new_worked_file(job_file,upload_type,recipient,email_text)
    @upload_type = upload_type
    @job_file = job_file
    @email_text = email_text

    subject = "Ads.BendBulletin.com Confirmation - New File Uploaded for Job #"+@job_file.job.id.to_s
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
    Rails.logger.info "*** Confirmation Sent ***"
  end

  # New proof added to a job
  def confirmation_new_proof_file(job_file,upload_type,recipient,email_text)
    @upload_type = upload_type
    @job_file = job_file
    @email_text = email_text

    subject = "Ads.BendBulletin.com Confirmation - Proof Uploaded - Job #"+@job_file.job.id.to_s
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
    Rails.logger.info "*** Confirmation Sent ***"
  end

  # Proof Approved
  def confirmation_proof_approved(job_file,upload_type,recipient,email_text)
    @upload_type = upload_type
    @job_file = job_file
    @email_text = email_text

    subject = "Ads.BendBulletin.com Confirmation - Proof Approved for Job #"+@job_file.job.id.to_s
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
    Rails.logger.info "*** Confirmation Sent ***"
  end

  # Proof Rejected
  def confirmation_proof_rejected(job_file,upload_type,recipient,email_text)
    @upload_type = upload_type
    @job_file = job_file
    @email_text = email_text

    subject = "Ads.BendBulletin.com Confirmation - Proof Rejected for Job #"+@job_file.job.id.to_s
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
    Rails.logger.info "*** Confirmation Sent ***"
  end
end
