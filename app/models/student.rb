class Student < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  
  belongs_to :school
  has_many :guardianships
  has_many :parents, :through => :guardianships
  has_many :addresses
  has_many :section_registrations
  has_many :sections, :through => :section_registrations
  
  
  accepts_nested_attributes_for :parents
  accepts_nested_attributes_for :addresses
  
  before_save :strip_extra_characters
  
  VALID_PHONE_REGEX = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  
#  validates :school, presence: true
  validates :school, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :grade_level, presence: true
  validates :gender, presence: true
  validates :dob, presence: true
  validates :home_phone, presence: true, format: {with: VALID_PHONE_REGEX}
  validates :cell_phone, allow_blank: true, format: {with: VALID_PHONE_REGEX}
  validates :email, allow_blank: true, format: {with: VALID_EMAIL_REGEX}
  
  
  
  def to_s
    "#{first_name} #{last_name}"
  end
  
  def strip_extra_characters
    self.home_phone = remove_non_digit_characters(home_phone)
    self.cell_phone = remove_non_digit_characters(cell_phone)
  end
  
  def self.search(search)
    if search
      where('first_name iLIKE ? OR last_name iLIKE ? OR name iLIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
  
  def self.school_search(search)
    if search
      where('name iLIKE ? OR site iLIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
  
  private
  
  def remove_non_digit_characters(string)
    if string.present?
      string.gsub(/[^0-9]/, "")
    end
  end
end
