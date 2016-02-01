class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :speciality
      t.string :contact_phone

      t.timestamps
    end
  end
end
