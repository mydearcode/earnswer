class CreateParticipates < ActiveRecord::Migration[6.0]
  def change
    create_table :participates do |t|
      t.references :response, null: false, foreign_key: true
      t.references :poll, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
