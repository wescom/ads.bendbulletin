class UploadType < ActiveRecord::Base
  attr_accessible :name, :tab_name, :tab_sort, :description, :instructions, :detailed_instructions, :email_recipient, :email_replyto,
                  :get_startdate, :get_application_used, :get_platform, :get_image_format, :get_vector_format, 
                  :get_color_spec, :get_job_type, :get_trapping, :get_files_to_run

  has_many :jobs
  
  validates_presence_of :name, :message=>'Name is required'
  validates_presence_of :tab_name, :message=>'Tab Name is required'
  validates_presence_of :email_recipient, :message=>'Email Recipient is required'
  validates_presence_of :email_replyto, :message=>'Email RepyTo is required'
  
end
