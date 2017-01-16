class RemoveQuestionIdToResults < ActiveRecord::Migration
  def change
    remove_column :results, :question_id, :integer
  end
end
