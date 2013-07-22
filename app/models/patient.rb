class Patient < ActiveRecord::Base
  has_secure_password

  attr_accessible :carb_ratio, :email, :name, :password,
   :password_confirmation, :phone_number, :age,
   :time_settings_attributes, :readings, :doctor_id,
   :insulin_time

  belongs_to :doctor
  has_many :time_settings
  has_many :readings
  accepts_nested_attributes_for :time_settings

  #TODO: Combine with doctor into User model?
  include ActiveModel::Validations
  include User
  validates_with UserValidator
  validates_presence_of :doctor

  def week_avg_bg
    readings = Reading.where(created_at: [Time.now - 1.week...Time.now], patient_id: id)
    total_bg = 0
    readings.each do |r|
      if r.blood_glucose.present?
        total_bg = total_bg + r.blood_glucose
      end
    end
    return 'N/A' if readings.size == 0
    total_bg / readings.size
  end

  def month_avg_bg
    readings = Reading.where(created_at: [Time.now - 1.month...Time.now], patient_id: id)
    total_bg = 0
    readings.each do |r|
      if r.blood_glucose.present?
        total_bg = total_bg + r.blood_glucose
      end
    end
    return 'N/A' if readings.size == 0
    total_bg / readings.size
  end
end
