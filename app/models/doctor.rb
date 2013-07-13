class Doctor < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :healthcare_provider, :name, :password, :password_confirmation, :phone_number
  has_many :patients
  #TODO: Combine with doctor into User model
  include ActiveModel::Validations
  include User
  validates_with UserValidator
end
