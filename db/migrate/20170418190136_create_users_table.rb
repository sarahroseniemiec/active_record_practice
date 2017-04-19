class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |table|
      table.string :fname
      table.string :lname
    end
  end
end
