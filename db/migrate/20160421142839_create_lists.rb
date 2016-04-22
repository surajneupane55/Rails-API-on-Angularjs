class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.date :due_date
      t.string :description
      t.boolean :status
      t.timestamps
    end
  end
end
