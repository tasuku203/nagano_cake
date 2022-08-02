class RemoveOrderFromOrderDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_details, :order, :integer
  end
end
