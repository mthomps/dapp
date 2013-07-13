class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :password_salt
      t.string :password_digest
      t.string :carb_ratio
      t.string :settings
      t.integer :age
      t.integer :doctor_id
      t.timestamps
    end
    add_index(:patients, :doctor_id)
    add_index(:patients, :email)
  end
end
