class RemoveCartIdOrderIdInLineItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :line_items, :cart_id
    remove_column :line_items, :order_id
  end
end
