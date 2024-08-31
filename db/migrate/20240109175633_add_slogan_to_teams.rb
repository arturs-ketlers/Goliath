class AddSloganToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :event_teams, :slogan, :string
  end
end
