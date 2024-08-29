class RemoveResultForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :results, :participants
  end
end
