class HomeController < ApplicationController
  def show
    @team_one = Team.new('one')
    @team_all = Team.new('all')

    @totals = Result.totals
    @participants_count = Participant.joins(:results).distinct.count
  end
end
