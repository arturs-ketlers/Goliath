class Result < ApplicationRecord
  belongs_to :participant, touch: true

  validates :participant, presence: true

  before_validation :set_distance_from_steps
  after_save :set_participant_total_distance
  after_destroy :set_participant_total_distance

  def set_distance_from_steps
    self.distance = steps * 0.7 / 1000 if steps.present?
  end

  def set_participant_total_distance
    participant.set_total_distance if participant.present?
  end
end
