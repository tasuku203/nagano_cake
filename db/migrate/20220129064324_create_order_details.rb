class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_id
      t.integer :customer_id
      t.integer :price
      t.integer :quantity
      t.integer :making_status

      t.timestamps
    end
  end
end
