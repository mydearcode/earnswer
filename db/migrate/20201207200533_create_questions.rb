class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title, nil: false
      t.text :description, nil: false
      t.decimal :reward, nil: false
      t.boolean :approved, default:false
      t.boolean :reviewed, default:false
      t.boolean :solved, default:false
      t.boolean :finished, default:false
      t.boolean :deleted, default:false
      t.references :user

      t.timestamps
    end
  end
end
