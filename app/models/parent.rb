class Parent < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  has_many :guardianships
  has_many :students, :through => :guardianships
  has_many :addresses
  
  before_save :strip_extra_characters
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_PHONE_REGEX = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
  validates :home_phone, presence: true, format: {with: VALID_PHONE_REGEX}
  validates :work_phone, allow_blank: true, format: {with: VALID_PHONE_REGEX}
  
  

  def to_s
    "#{first_name} #{last_name}"
  end
  
  def strip_extra_characters
    self.home_phone = remove_non_digit_characters(home_phone)
    self.work_phone = remove_non_digit_characters(work_phone)
  end
  
  private
  def remove_non_digit_characters(string)
    if string.present?
      string.gsub(/[^0-9]/, "")
    end
  end
end
