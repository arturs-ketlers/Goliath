class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :team
      t.string    :avatar_file_name, default: ''
      t.integer   :avatar_file_size
      t.string    :avatar_content_type
      t.datetime  :avatar_updated_at
      t.decimal :total_distance, precision: 8, scale: 3
      t.timestamps
    end
  end
end
