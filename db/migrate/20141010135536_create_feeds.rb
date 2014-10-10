class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title,      null: false
      t.string :url,        null: false
      t.string :feed_url,   null: false
    end

    add_index :feeds, [:feed_url], unique: true
  end
end
