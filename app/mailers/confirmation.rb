class Confirmation < ActionMailer::Base
  default :from => "no-reply@utility.wescompapers.com"

  # New job uploaded to database
  def confirmation_new_job(upload_type,job,recipient)
    @upload_type = upload_type
    @job = job

    subject = "Ads.BendBulletin.com Confirmation"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
#      format.text
    end
  end

  # New job_file added to a job
  def confirmation_new_job_file(job_file,upload_type,current_user)
    @upload_type = upload_type
    @job_file = job_file

    recipient = current_user.email
    subject = "Ads.BendBulletin.com Confirmation - New File Added"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
  end

  # New worked file added to a job
  def confirmation_new_worked_file(job_file,upload_type,current_user)
    @upload_type = upload_type
    @job_file = job_file

    recipient = current_user.email
    subject = "Ads.BendBulletin.com Confirmation - New File Added"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
  end

  # New proof added to a job
  def confirmation_new_proof_file(job_file,upload_type,current_user)
    @upload_type = upload_type
    @job_file = job_file

    recipient = current_user.email
    subject = "Ads.BendBulletin.com Confirmation - Proof Added"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
  end

  # Proof Approved
  def confirmation_proof_approved(job_file,upload_type,current_user)
    @upload_type = upload_type
    @job_file = job_file

    recipient = current_user.email
    subject = "Ads.BendBulletin.com Confirmation - Proof Approved"
    mail(:to => recipient, :subject => subject) do |format|
      format.html
    end
  end
end
