class RemoveResultForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :results, :participants
  end
end
