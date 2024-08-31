class CreateEventTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :event_teams do |t|
      t.string :name
      t.decimal :total_distance, precision: 8, scale: 3
      t.string :color
      t.timestamps
    end

    add_reference :event_participants, :event_team, index: true
  end
end
