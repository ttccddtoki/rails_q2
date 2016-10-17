class AddQestionNumberToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :question_number, :integer
  end
end
