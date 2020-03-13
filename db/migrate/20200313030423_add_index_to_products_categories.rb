class AddIndexToProductsCategories < ActiveRecord::Migration[6.0]
  def change
    add_index :products_categories, %i[product_id category_id], unique: true
  end
end
