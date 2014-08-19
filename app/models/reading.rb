class Reading < ActiveRecord::Base
  validates_presence_of :blood_glucose, :carbs, :insulin
  belongs_to :patient

  def self.at_risk_threshold
    250
  end
end
