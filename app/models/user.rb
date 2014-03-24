class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me,
                  :company, :acct_no, :phonenum, :phonenum2, :fax, :address1, :address2, :city, :state, :zip
  
  before_create :set_default_role
  after_create :send_welcome_email 
  
  has_many :jobs
  
  validates_presence_of :name, :message=>'Name is required'

  private
  def set_default_role
    self.add_role :view
  end

  def send_welcome_email
    Confirmation.confirmation_new_register(self).deliver
  end  
end
