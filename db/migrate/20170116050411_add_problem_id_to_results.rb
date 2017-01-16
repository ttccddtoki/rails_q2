class AddProblemIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :problem_id, :integer
  end
end
