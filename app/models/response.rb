class Response < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  has_many :participates, dependent: :destroy
  
  accepts_nested_attributes_for :participates, reject_if: :all_blank, allow_destroy: true
end
