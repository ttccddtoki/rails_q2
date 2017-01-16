class AddIsCorrectToResultLists < ActiveRecord::Migration
  def change
    add_column :result_lists, :is_correct, :boolean
  end
end
