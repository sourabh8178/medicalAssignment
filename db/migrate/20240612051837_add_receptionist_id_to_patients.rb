class AddReceptionistIdToPatients < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :receptionist_id, :integer
  end
end
