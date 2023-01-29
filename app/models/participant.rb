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

  before_save :set_total_distance

  def set_total_distance
    self.total_distance = Result.where(participant_id: id).pluck(:distance).compact.sum
  end
end
