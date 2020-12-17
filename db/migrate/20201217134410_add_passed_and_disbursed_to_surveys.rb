class AddPassedAndDisbursedToSurveys < ActiveRecord::Migration[6.0]
  def change
    add_column :surveys, :passed, :boolean, default: false
    add_column :surveys, :disbursed, :boolean, default: false
  end
end
