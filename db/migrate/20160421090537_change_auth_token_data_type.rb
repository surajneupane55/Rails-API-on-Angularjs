class ChangeAuthTokenDataType < ActiveRecord::Migration
  def change
    add_column :users, :authenticate_token, :string, unique: :true
  end
end
