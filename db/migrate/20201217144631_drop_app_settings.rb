class DropAppSettings < ActiveRecord::Migration[6.0]
  def up
    drop_table :app_settings
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
