class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :email
      t.string :password_salt
      t.string :password_digest
      t.string :phone_number
      t.string :healthcare_provider
      t.timestamps
    end
    add_index(:doctors, :email)
  end
end
