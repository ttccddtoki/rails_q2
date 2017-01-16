class RemoveQuestionIdToChoices < ActiveRecord::Migration
  def change
    remove_column :choices, :question_id, :integer
  end
end
