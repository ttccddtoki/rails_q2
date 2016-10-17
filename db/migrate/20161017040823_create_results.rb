class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :result_list
      t.references :question
      t.boolean :is_correct
      t.timestamps null: false
    end
  end
end
