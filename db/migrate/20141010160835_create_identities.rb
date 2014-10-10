class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :uid,  null: false
    end

    add_index :identities, [:uid], unique: true
  end
end
