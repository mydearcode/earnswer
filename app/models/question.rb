class Question < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :reward, presence: true
    belongs_to :user
    has_many :answers, dependent: :destroy
end
