class Team
  include ActiveModel::Model

  attr_accessor :key, :participants, :participant_count, :distance, :points

  def initialize(key, options = {})
    @event = Event.find_by(id: options[:event_id])
    @key = key
    @participants = set_participants
    @participant_count = @participants.count
    @distance = set_distance
    @points = set_points
  end

  def set_participants
    @event.participants.try(:"team_#{key}")&.with_results
  end

  def all?
    key == 'all'
  end

  def set_distance
    return 0 if participant_count.zero?

    pt = all? ? @participants.pluck(:total_distance).compact.sum : @participants.last.total_distance
    pt.presence || 0
  end

  def set_points
    pt = all? ? distance : set_one_points
    return 0 unless pt

    pt.floor(0)
  end

  def set_all_points
    # Goliath v1
    return 0 if participant_count.zero?

    avg = distance.to_f / participant_count
    points = avg * (1 + participant_count * 0.25)
    points
  end

  def set_one_points
    distance.to_f * 5
  end
end
