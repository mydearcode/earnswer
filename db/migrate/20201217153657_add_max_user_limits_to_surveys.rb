class AddMaxUserLimitsToSurveys < ActiveRecord::Migration[6.0]
  def change
    add_column :surveys, :max_user_limit, :integer, default: 20 
    add_column :surveys, :max_day_limit, :integer, default: 14
  end
end
