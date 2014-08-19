class Patient < ActiveRecord::Base
  has_secure_password

  belongs_to :doctor
  has_many :time_settings
  has_many :readings
  accepts_nested_attributes_for :time_settings

  #TODO: Combine with doctor into User model?
  include ActiveModel::Validations
  include User
  validates_with UserValidator
  validates_presence_of :doctor

  def weekly_avg_bg
    readings = Reading.where(created_at: [Time.now - 1.week...Time.now], patient_id: id)
    total_bg = 0
    readings.each do |r|
      if r.blood_glucose.present?
        total_bg = total_bg + r.blood_glucose
      end
    end
    return -1 if readings.size == 0
    total_bg / readings.size
  end

  def monthly_avg_bg
    readings = Reading.where(created_at: [Time.now - 1.month...Time.now], patient_id: id)
    total_bg = 0
    readings.each do |r|
      if r.blood_glucose.present?
        total_bg = total_bg + r.blood_glucose
      end
    end
    return -1 if readings.size == 0
    total_bg / readings.size
  end

  def readings_chart_data(readings)
    @chart_readings = Reading.where(patient_id: id, created_at: [Time.now - 1.week..Time.now]).order('created_at DESC')
    # group the readings by same day?
    # grouped_readings = readings.group_by { |r| r.created_at.strftime '%Y%m%d' }
    result = readings.map do |r|
      {
        created_at: r.created_at.strftime("%Y-%m-%d %H:%M"),
        blood_glucose: r.blood_glucose
      }
    end
  end
end
