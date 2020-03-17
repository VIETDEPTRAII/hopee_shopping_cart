class RemoveReferencesInLineItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :line_items, :product_id
  end
end
