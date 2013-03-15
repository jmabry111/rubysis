class Student < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  
  belongs_to :school
  has_many :guardianships
  has_many :parents, :through => :guardianships
  has_many :addresses
  
  
  accepts_nested_attributes_for :parents
  accepts_nested_attributes_for :addresses
  
  VALID_PHONE_REGEX = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  
  validates :school, presence:true
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :grade_level, presence:true
  validates :gender, presence:true
  validates :dob, presence:true
  validates :home_phone, presence:true, format: {with:VALID_PHONE_REGEX}
  validates :cell_phone, allow_blank:true, format: {with:VALID_PHONE_REGEX}
  validates :email, allow_blank:true, format: {with:VALID_EMAIL_REGEX}
  
  
  
  def to_s
    "#{first_name} #{last_name}"
  end
end
