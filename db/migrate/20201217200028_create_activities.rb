class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :subject
      t.string :act_name

      t.timestamps
    end
  end
end
