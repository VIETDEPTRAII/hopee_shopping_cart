class AddIndexToShopsEmail < ActiveRecord::Migration[6.0]
  def change
    add_index :shops, :email, unique: true
  end
end
