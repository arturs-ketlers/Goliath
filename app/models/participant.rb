class Participant < ApplicationRecord
  validates :name, :team, presence: true

  has_many :results, dependent: :destroy

  has_attached_file :avatar,
    styles: { main: "400x400#", small_thumb: "64x64#" },
    default_url: 'missing/participant.png'
  validates_attachment_content_type :avatar, :content_type => /image/
  validates_attachment_size :avatar, less_than: 2.megabytes


  scope :team_one, (-> { where(team: 'one') })
  scope :team_all, (-> { where(team: 'all') })
  scope :with_results, (-> { joins(:results).distinct })

  after_save :set_stats
  after_touch :set_stats

  def to_s
    name
  end

  def set_stats
    return if results.blank?

    update_columns(
      total_distance: results.pluck(:distance).compact.sum,
      last_result_date: results.select(:date).order('date desc').first.date
    )
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
