class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.decimal :distance, precision: 8, scale: 3
      t.references :participant, null: false, foreign_key: true, index: true
      t.date :datetime
    end
  end
end
