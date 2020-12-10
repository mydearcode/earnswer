class AddDisbursedToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :disbursed, :boolean, default: false
  end
end
