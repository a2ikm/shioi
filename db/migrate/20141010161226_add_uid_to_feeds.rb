class AddUidToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :uid, :string, null: false
    add_index :feeds, [:uid], unique: true
  end
end
