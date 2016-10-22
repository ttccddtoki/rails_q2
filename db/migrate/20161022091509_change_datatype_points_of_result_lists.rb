class ChangeDatatypePointsOfResultLists < ActiveRecord::Migration
  def change
    change_column :result_lists, :points, :float
  end
end
