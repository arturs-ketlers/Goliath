class Participant < ApplicationRecord
  validates :name, presence: true

  has_many :event_participants, dependent: :destroy

  has_attached_file :avatar,
    styles: { main: "400x400#", small_thumb: "64x64#" },
    default_url: 'missing/participant.png'
  validates_attachment_content_type :avatar, :content_type => /image/
  validates_attachment_size :avatar, less_than: 2.megabytes

  def to_s
    name
  end

  def step_length
    height ? (height * 0.430).round(3) : 0.700
  end
end
