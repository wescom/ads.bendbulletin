class GlobalSettings < ActiveRecord::Base
  attr_accessible :contact_email, :welcome, :general_instructions, :disclaimer
end
