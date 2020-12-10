class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :title
      t.text :description
      t.decimal :reward, null: false
      t.boolean :approved, default: false
      t.boolean :reviewed, default: false
      t.boolean :solved, default: false
      t.boolean :finished, default: false
      t.boolean :deleted, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
