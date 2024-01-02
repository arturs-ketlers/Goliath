class EventParticipant < ApplicationRecord
  belongs_to :participant
  belongs_to :event
  belongs_to :event_team

  has_many :results, dependent: :destroy

  after_save :set_stats
  after_touch :set_stats

  delegate :height, :avatar, :name, :step_length, to: :participant

  validates :participant_id, uniqueness: { scope: :event_id }

  scope :team_one, (-> { where(team: 'one') })
  scope :team_all, (-> { where(team: 'all') })
  scope :with_results, (-> { joins(:results).distinct })

  def to_s
    name
  end

  def set_stats
    update_columns(total_distance: results.pluck(:distance)&.compact&.sum)
    event_team&.update_total_distance
  end

  def steps_per_day
    steps = results.pluck(:distance).compact.sum / 0.7 * 1000
    days = results.pluck(:date).uniq.count

    # Round to closest n steps
    round_by = 10

    {
      steps: (steps / days / round_by).round(0) * round_by,
      days: days
    }
  end
end
