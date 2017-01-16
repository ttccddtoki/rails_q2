class RenameQuestionsToProblems < ActiveRecord::Migration
  def change
    rename_table :questions, :problems
  end
end
