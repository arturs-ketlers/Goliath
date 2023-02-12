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

  after_save :set_total_distance
  after_save :set_last_result_date

  def to_s
    name
  end

  def set_total_distance
    distance = results.pluck(:distance).compact.sum
    update_column(:total_distance, distance)
  end

  def set_last_result_date
    date = results.select(:date).order('date desc').first.date
    update_column(:last_result_date, date)
  end
end
