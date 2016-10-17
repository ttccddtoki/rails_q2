class CreateResultLists < ActiveRecord::Migration
  def change
    create_table :result_lists do |t|
      t.references :user
      t.integer :points, default: 0
      t.timestamps null: false
    end
  end
end
