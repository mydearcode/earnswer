class AddMaxPollsAndMaxOptionsToAppSettings < ActiveRecord::Migration[6.0]
  def change
    add_column :app_settings, :max_polls, :integer, default: 10
    add_column :app_settings, :max_options, :integer, default: 8
  end
end
