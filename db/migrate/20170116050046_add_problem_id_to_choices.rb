class AddProblemIdToChoices < ActiveRecord::Migration
  def change
    add_column :choices, :problem_id, :integer
  end
end
