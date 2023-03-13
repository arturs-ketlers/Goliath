class Result < ApplicationRecord
  belongs_to :event_participant, touch: true

  validates :event_participant, presence: true
  before_validation :set_distance_from_steps

  delegate :step_length, to: :event_participant

  def set_distance_from_steps
    self.distance = steps * step_length / 1000 if steps.present?
  end
end
