class Patient < ActiveRecord::Base
  has_secure_password

  attr_accessible :carb_ratio, :email, :name, :password, :password_confirmation, :phone_number, :age, :time_settings_attributes, :readings

  belongs_to :doctor
  has_many :time_settings
  has_many :readings
  accepts_nested_attributes_for :time_settings

  #TODO: Combine with doctor into User model
  include ActiveModel::Validations
  include User
  validates_with UserValidator
  validates_presence_of :doctor
end
