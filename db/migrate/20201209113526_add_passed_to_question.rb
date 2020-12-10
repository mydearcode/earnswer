class AddPassedToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :passed, :boolean, default: false
  end
end
