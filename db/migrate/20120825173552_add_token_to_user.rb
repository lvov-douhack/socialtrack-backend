class AddTokenToUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :token, length: 32
    end
  end
end
