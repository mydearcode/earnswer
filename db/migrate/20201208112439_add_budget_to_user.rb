class AddBudgetToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :budget, :decimal, precision: 14, scale: 2, default: 0.0
    add_column :users, :approved, :boolean, default: false
    add_column :users, :banned, :boolean, default: false
    add_column :users, :deleted, :boolean, default: false
    add_column :users, :mail_activated, :boolean, default: false
    add_column :users, :sms_activated, :boolean, default: false
    add_column :users, :role, :integer, default: 1
    add_column :users, :admin, :boolean, default: false
  end
end
