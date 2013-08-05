class Reading < ActiveRecord::Base
  attr_accessible :read_time, :blood_glucose, :carbs, :insulin,
  :exercised, :notes, :patient_id
  validates_presence_of :blood_glucose, :carbs, :insulin
  belongs_to :patient

  def self.at_risk_threshold
    250
  end
end
