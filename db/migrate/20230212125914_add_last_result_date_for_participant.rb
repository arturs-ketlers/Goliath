class AddLastResultDateForParticipant < ActiveRecord::Migration[6.1]
  def change
    add_column :participants, :last_result_date, :datetime
  end

  def self.up
    Participant.find_each { |p| p.set_last_result_date }
  end
end
