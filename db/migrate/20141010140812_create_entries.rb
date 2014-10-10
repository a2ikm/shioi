class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references  :feed,    null: false
      t.string      :title,   null: false
      t.string      :url,     null: false
      t.text        :body

      t.timestamps
    end

    add_index :entries, [:feed_id, :created_at]
  end
end
