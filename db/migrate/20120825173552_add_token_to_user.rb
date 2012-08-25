class AddTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :token, :string, length: 32
  end
end
