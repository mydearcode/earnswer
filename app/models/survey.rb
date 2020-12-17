class Survey < ApplicationRecord
    belongs_to :user
    has_many :polls, dependent: :destroy
    has_many :responses, dependent: :destroy
    
    accepts_nested_attributes_for :polls, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :responses, reject_if: :all_blank, allow_destroy: true
    
    validates :title, presence: true
    validates :description, presence: true
    
    
    
end
