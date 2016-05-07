class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :description
      t.boolean :status
      t.timestamps
      t.integer :task_id
    end
  end
end
