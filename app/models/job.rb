class Job < ActiveRecord::Base
  attr_accessible :upload_type_id, :user_id, :name, :company, :salesrep, :acct_no, :address1, :address2, :city, :state, :zip,
     :email, :phonenum, :phonenum2, :fax, :startdate, :application, :application_other, :application_version, :platform, 
     :image_format, :vector_format, :color_spec, :job_type, :trapping, :files_to_run, :instructions, :job_files_attributes,
     :disclaimer
  
  belongs_to :upload_type
  belongs_to :user
  has_many :job_files, :dependent => :destroy
  accepts_nested_attributes_for :job_files, :allow_destroy => true
  
  validates_acceptance_of :disclaimer, :allow_nil => false, :accept => true, :on => :create, :message=>'Must accept Terms of Service'
  validates_presence_of :name, :on => :create, :message=>'Name is required'
  validates_presence_of :phonenum, :on => :create, :message=>'Phone number required'
end
