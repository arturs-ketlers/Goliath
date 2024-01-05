class EventTeam < ApplicationRecord
  has_many :participants, dependent: :destroy, class_name: "EventParticipant"

  def to_s
    name.presence || "##{id}"
  end

  def update_total_distance
    update_columns(total_distance: participants.pluck(:total_distance)&.compact&.sum)
  end

  def self.colors_to_select
    I18n.t('event_team.colors').invert
  end

  def total_steps
    participants.map(&:total_steps).sum
  end
end
