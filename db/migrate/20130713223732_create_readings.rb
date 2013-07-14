class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :read_time
      t.integer :blood_glucose
      t.integer :carbs
      t.integer :insulin
      t.boolean :exercised
      t.string  :notes
      t.integer :patient_id
      t.timestamps
    end
    add_index(:readings, :patient_id)
  end
end
