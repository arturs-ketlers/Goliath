class AddHeightToParticipant < ActiveRecord::Migration[6.1]
  def change
    add_column :participants, :height, :decimal, precision: 4, scale: 2
  end
end
