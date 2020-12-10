class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.text :body, null: false
      t.boolean :approved, default: false
      t.boolean :deleted, default: false
      t.boolean :reviewed, default: false
      t.boolean :solved, default: false

      t.timestamps
    end
  end
end
