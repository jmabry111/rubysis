class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :work_phone, :home_phone, :cell_phone
  # attr_accessible :title, :body
  
  has_many :addresses
  
  VALID_PHONE_REGEX = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, presence:true
  validates :email, presence:true, format: {with:VALID_EMAIL_REGEX}
  validates :work_phone, presence:true, format: {with:VALID_PHONE_REGEX}
  validates :home_phone, allow_blank:true, format: {with:VALID_PHONE_REGEX}
  validates :cell_phone, allow_blank:true, format: {with:VALID_PHONE_REGEX}
end
