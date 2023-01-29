class HomeController < ApplicationController
  def show
    @team_one = Team.new('one')
    @team_all = Team.new('all')
  end
end
