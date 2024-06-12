class ChangeColoumnToPatient < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :name, :string
    add_column :patients, :age, :string
    add_column :patients, :gender, :string
    add_column :patients, :address, :string
    add_column :patients, :phone_number, :string
    remove_column :patients, :first_name, :string
    remove_column :patients, :last_name, :string
    remove_column :patients, :date_of_birth, :date
    add_column :users, :name, :string
  end
end
