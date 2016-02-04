class AddUserIdToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :user_id, :string
    add_index :patients, :user_id
  end
end
