class JobFile < ActiveRecord::Base
  attr_accessible :job_id, :file, :file_type
  
  belongs_to :job

  validates_presence_of :file, :on => :create, :message=>'File is required'
#  do_not_validate_attachment_file_type :file

  has_attached_file :file, 
      :styles => { 
        :thumb => ["200x200>",:jpg]
      },
      :url => "/system/uploaded_files/:id/:style_:basename.:extension",  
      :path => ":rails_root/public/system/uploaded_files/:id/:style_:basename.:extension",
      :default_url => "/images/no-image.jpg"

  before_post_process :process_file?
  def process_file?
    if (file_content_type.to_s =~ /(image)/) or (file_content_type.to_s =~ /(pdf)/)
      return true
    else
      return false
    end
  end

  class << self
    def job_files
      where(:file_type => "job_file")
    end
  
    def worked_files
      where(:file_type => "worked_file")
    end
  
    def proof_files
      where(:file_type => "proof_file")
    end
  end

end
