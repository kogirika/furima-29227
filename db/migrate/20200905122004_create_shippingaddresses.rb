class CreateShippingaddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shippingaddresses do |t|
      t.references :purchase,   null: false,foreign_key: true
      t.string :postal_code,    null: false
      t.integer :prefecture,    null: false
      t.string :city,           null: false
      t.string :address,        null: false
      t.string :building,       null: false
      t.string :phone_number,   null: false
      t.timestamps
    end
  end
end