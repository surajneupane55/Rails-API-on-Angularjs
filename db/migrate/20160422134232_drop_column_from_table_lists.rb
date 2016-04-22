class DropColumnFromTableLists < ActiveRecord::Migration
  def change
    remove_column :lists, :due_date
  end
end
