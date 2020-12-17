class CreateAppSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :app_settings do |t|
      t.decimal :max_reward_per_user, default: 1000.0
      t.decimal :min_reward_per_user, default: 0.10
      t.decimal :min_user_limit_per_survey, default: 20
      t.decimal :max_user_limit_per_survey, default: 100000
      t.decimal :min_reward_per_question, default: 5.0
      t.decimal :max_reward_per_question, default: 1000
      t.integer :max_onair_day, default: 14
      t.integer :min_onair_day, default: 1
      t.integer :withdraw_limit, default: 200
      t.integer :shop_limit, default: 100
      t.timestamps
    end
  end
end
