class AddFreezedBudgetToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :freezed_budget, :decimal, precision: 6, scale: 4, default: 0.0
  end
end
