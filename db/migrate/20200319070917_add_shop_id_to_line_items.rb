class AddShopIdToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :shop_id, :integer
  end
end
