class EmailText < ActiveRecord::Base
  attr_accessible :name, :email_type, :subject, :header, :pretext, :posttext, 
    :show_contact_info, :show_job_info, :show_job_file_info
end
