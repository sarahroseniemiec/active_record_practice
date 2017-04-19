class CreateAddressesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |table|
      table.string :line1
      table.string :line2
      table.string :city
      table.string :state
      table.integer :zip
    end
  end
end
