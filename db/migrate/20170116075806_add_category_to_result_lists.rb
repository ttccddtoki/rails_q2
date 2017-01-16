class AddCategoryToResultLists < ActiveRecord::Migration
  def change
    add_column :result_lists, :category, :integer
  end
end
