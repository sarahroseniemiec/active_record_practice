class CreateUserAddressesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user_addresses do |table|
      table.integer :user_id
      table.integer :address_id
    end
  end
end
