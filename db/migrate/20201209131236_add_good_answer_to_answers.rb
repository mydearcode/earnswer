class AddGoodAnswerToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :good_answer, :boolean, default: false
  end
end
