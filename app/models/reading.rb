class Reading < ActiveRecord::Base
  attr_accessible :read_time, :blood_glucose, :carbs, :insulin, :exercised, :notes, :patient_id
  belongs_to :patient
end
