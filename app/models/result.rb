class Result < ApplicationRecord
  belongs_to :participant, touch: true

  validates :participant, presence: true
  before_validation :set_distance_from_steps

  def set_distance_from_steps
    self.distance = steps * 0.7 / 1000 if steps.present?
  end

  def self.totals
    distance = pluck(:distance).compact.sum
    steps = distance / 0.7 * 1000

    # Round to closest n steps
    round_by = 10

    {
      distance: distance.round(2),
      steps: (steps / round_by).round(0) * round_by,
    }
  end
end
