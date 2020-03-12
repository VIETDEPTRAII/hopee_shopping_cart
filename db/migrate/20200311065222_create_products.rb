class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :picture
      t.integer :price
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
    add_index :products, %i[shop_id created_at]
  end
end
