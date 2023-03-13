class CreateEvent < ActiveRecord::Migration[6.1]
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :event_type
      t.date :date_from
      t.date :date_till
      t.boolean :is_active
      t.timestamps
    end

    # Create first event for existing participants/results
    Event.find_or_create_by(event_type: 'goliath', is_active: true)
  end

  def self.down
    drop_table :events
  end
end
