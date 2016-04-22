class ChangeAuthTokenDataType < ActiveRecord::Migration
  def change
    change_column :users, :authenticate_token, :string, unique: :true
  end
end
