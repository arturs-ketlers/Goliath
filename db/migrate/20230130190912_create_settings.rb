class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.string :category
      t.string :key
      t.string :value
      t.timestamps
    end
  end
end
