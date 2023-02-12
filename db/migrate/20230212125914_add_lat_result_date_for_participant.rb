class AddLatResultDateForParticipant < ActiveRecord::Migration[6.1]
  def change
    add_column :participants, :last_result_date, :datetime
  end
end
