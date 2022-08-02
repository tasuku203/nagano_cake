class AddOrderToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :order, :integer
  end
end
