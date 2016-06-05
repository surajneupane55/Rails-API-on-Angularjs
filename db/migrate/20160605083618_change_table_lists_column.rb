class ChangeTableListsColumn < ActiveRecord::Migration
  def change
    change_column :lists, :description, :string, null: false
    change_column :lists, :task_id, :integer,  null: false
  end
end
