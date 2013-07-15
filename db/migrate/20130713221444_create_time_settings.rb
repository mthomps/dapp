class CreateTimeSettings < ActiveRecord::Migration
  def change
    create_table :time_settings do |t|
      t.string :time
      t.string :value
      t.string :category
      t.integer :patient_id
      t.timestamps
    end
    add_index(:time_settings, :patient_id)
  end
end
