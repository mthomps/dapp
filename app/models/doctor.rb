class Doctor < ActiveRecord::Base
  has_secure_password

  has_many :patients
  #TODO: Combine with doctor into User model
  include ActiveModel::Validations
  include User
  validates_with UserValidator
end
