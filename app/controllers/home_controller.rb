class HomeController < ApplicationController
  def show
    @event = Event.active
    # @team_one = Team.new('one', event_id: @event.id)
    # @team_all = Team.new('all', event_id: @event.id)
    @teams = EventTeam.all.order(total_distance: :desc)

    @totals = @event.totals if @event.event_type == 'goliath'
    @participants_count = @event.participants.with_results.count
  end
end
