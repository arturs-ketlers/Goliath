class AddStepsAndCommentToResult < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :steps, :integer
    add_column :results, :comment, :text
  end
end
