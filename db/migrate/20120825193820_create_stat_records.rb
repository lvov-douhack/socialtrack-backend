class CreateStatRecords < ActiveRecord::Migration
  def change
    create_table :stat_records do |t|
      t.reference :user, null: false
      t.networkname :string, null: false
      t.integer :seconds, null: false
      t.datetime :created_at, null: false
    end
  end
end
