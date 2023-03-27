class AddTargetToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :target_type, :string
    add_column :events, :target, :decimal, precision: 8, scale: 3
  end
end
