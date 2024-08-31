class RenameResultDateCol < ActiveRecord::Migration[6.1]
  def change
    rename_column :results, :datetime, :date
  end
end
