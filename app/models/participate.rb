class Participate < ApplicationRecord
  belongs_to :response
  belongs_to :poll
  belongs_to :option
end
