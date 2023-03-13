class CreateEventParticipant < ActiveRecord::Migration[6.1]
  def self.up
    create_table :event_participants do |t|
      t.references :participant, index: true
      t.references :event, index: true
      t.string :team
      t.decimal :total_distance, precision: 8, scale: 3
      t.timestamps
    end

    rename_column :results, :participant_id, :event_participant_id

    if (event = Event.first)
      Participant.find_each do |pt|
        pt.event_participants.find_or_create_by(
          event_id: event.id,
          team: pt.team
        )
      end
    end
  end

  def self.down
    drop_table :event_participants
    rename_column :results, :event_participant_id, :participant_id
  end
end
