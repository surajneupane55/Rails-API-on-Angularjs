class AddDefaultValueT0ColumnLists < ActiveRecord::Migration
  def change
    change_column :lists, :status, :boolean, default: false

  end
  end
