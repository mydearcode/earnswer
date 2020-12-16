class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.integer :questionType
      t.boolean :finished, default: false
      t.boolean :deleted, default: false
      t.references :survey, null: false, foreign_key: true
      t.timestamps
    end
  end
end
