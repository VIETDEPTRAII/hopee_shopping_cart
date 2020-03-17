class AddUserIdAndPhoneToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :phone, :string
    add_column :orders, :customer_id, :integer
  end
end
