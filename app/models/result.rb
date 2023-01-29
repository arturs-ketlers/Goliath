class Result < ApplicationRecord
  belongs_to :participant

  validates :participant, presence: true
end
