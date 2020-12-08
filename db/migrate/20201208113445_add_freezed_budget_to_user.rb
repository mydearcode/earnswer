class AddFreezedBudgetToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :freezed_budget, :decimal
  end
end
