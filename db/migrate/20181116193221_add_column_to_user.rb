class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
  add_column :users, :fname, :string
  add_column :users, :lname, :string
  add_column :users, :birthdate, :date
  end
end
