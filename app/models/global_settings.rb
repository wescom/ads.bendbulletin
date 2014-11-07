class GlobalSettings < ActiveRecord::Base
  attr_accessible :contact_email, :register_text, :welcome, :general_instructions, :disclaimer
end
