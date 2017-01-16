class AddCategoryToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :category, :integer
  end
end
