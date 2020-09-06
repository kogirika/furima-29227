class CreateShippingaddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shippingaddresses do |t|
      t.references :purchase
      t.string :postal_code
      t.integer :prefecture
      t.string :city
      t.string :address
      t.string :building
      t.string :phone_number
      t.timestamps
    end
  end
end
