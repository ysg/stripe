class UsersAddColumnCustomerId < ActiveRecord::Migration
  def up
    add_column :users, :type, :string
    add_column :users, :stripe_customer_id, :string
  end

  def down
    remove_column :users, :type
    remove_column :users, :stripe_customer_id
  end
end
