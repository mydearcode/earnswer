class Survey < ApplicationRecord
    belongs_to :user
    has_many :polls, dependent: :destroy
    accepts_nested_attributes_for :polls
    has_many :options, through: :polls
    accepts_nested_attributes_for :options
    validates :title, presence: true
    validates :description, presence: true
    
    
    
end
