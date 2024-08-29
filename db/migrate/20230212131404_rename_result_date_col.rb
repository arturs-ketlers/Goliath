class RenameResultDateCol < ActiveRecord::Migration[6.0]
  def change
    rename_column :results, :datetime, :date
  end
end
