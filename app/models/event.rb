class Event < ApplicationRecord
  has_many :participants, dependent: :destroy, class_name: "EventParticipant"

  def to_s
    name.presence || "#{event_type} ##{id}"
  end

  def to_label
    to_s
  end

  def totals
    distance = 100 # pluck(:distance).compact.sum
    steps = distance / 0.7 * 1000
    days = 28

    # Round to closest n steps
    round_by = 10

    {
      distance: distance.round(1),
      distance_avg: (distance / days).round(1),
      steps: (steps / round_by).round(0) * round_by,
      steps_avg: (steps / days / round_by).round(0) * round_by
    }
  end

  def self.active
    where(is_active: true).order(date_from: :desc).first
  end

  def self.types_to_select
    I18n.t('event.types').invert
  end

  def total_distance
    participants.pluck(:total_distance).sum
  end
end
