class UserValidator < ActiveModel::Validator
  def validate(record)
    doc = Doctor.find_by_email(record.email)
    pat = Patient.find_by_email(record.email)
    doc.blank? and pat.blank?
  end
end