class Option < ApplicationRecord
  belongs_to :poll
  #validates :poll_id, presence: true
end
