class Confirmation < ActionMailer::Base
  default :from => "no-reply@utility.wescompapers.com"

  def confirmation_notification(upload_type,job)
    @upload_type = upload_type
    @job = job
    @url  = job_url(@job)
    mail(:to => job.email,
        :subject => "Ads.BendBulletin.com Confirmation") do |format|
      format.html
#      format.text
    end
  end
end
