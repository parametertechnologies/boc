class AddGpsToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :gps, :string
  end
end
