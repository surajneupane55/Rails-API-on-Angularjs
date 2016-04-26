class DeleteColumnListIdFromTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :list_id
  end
end
