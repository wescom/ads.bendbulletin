class JobMailer < ActionMailer::Base
  default :from => "notifications@example.com"

  def job_uploaded_notification(upload_type,job)
    @upload_type = upload_type
    @job = job
    @url  = job_url(@job)
    mail(:to => upload_type.email_recipient,
        :subject => "Files have been uploaded to ads.bendbulletin.com") do |format|
      format.html
#      format.text
    end
  end
end
