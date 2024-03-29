class Option < ApplicationRecord
  belongs_to :poll
  has_many :participates, dependent: :destroy
  accepts_nested_attributes_for :participates, reject_if: :all_blank, allow_destroy: true
  #validates :poll_id, presence: true
end
