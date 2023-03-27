class Event < ApplicationRecord
  has_many :participants, dependent: :destroy, class_name: "EventParticipant"

  def to_s
    name.presence || "#{event_type} ##{id}"
  end

  def to_label
    to_s
  end

  def totals
    distance = participants.pluck(:total_distance).compact.sum
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

  def self.target_types_to_select
    I18n.t('event.target_types').invert
  end

  def total_distance
    participants.pluck(:total_distance).sum
  end

  def duration
    # Duration in days (for target daily update)
    return 0 unless date_from && date_till

    date_till - date_from
  end

  def target_today
    return -1 if duration.blank?

    event_days = Time.zone.today - date_from
    per_day = target / duration
    event_days * per_day
  end
end
