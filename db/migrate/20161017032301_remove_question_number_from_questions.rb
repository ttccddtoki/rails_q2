class RemoveQuestionNumberFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :question_number
  end
end
