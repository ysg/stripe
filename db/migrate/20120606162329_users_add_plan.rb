class UsersAddPlan < ActiveRecord::Migration
  def up
    add_column :users, :plan, :integer
  end

  def down
    remove_column :users, :plan
  end
end
