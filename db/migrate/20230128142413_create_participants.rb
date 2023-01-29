class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :team
      t.attachment :avatar
      t.decimal :total_distance, precision: 8, scale: 3
      t.timestamps
    end
  end
end
