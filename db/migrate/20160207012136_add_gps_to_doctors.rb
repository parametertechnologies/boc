class AddGpsToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :gps, :string
  end
end
