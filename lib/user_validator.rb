class UserValidator < ActiveModel::Validator
  def validate(record)
    doc = Doctor.find_by_email(record.email)
    pat = Patient.find_by_email(record.email)
    if doc.blank? and pat.blank?
      return true
    else
      record.errors[:email] << "is already in use by another account."
    end
  end
end
