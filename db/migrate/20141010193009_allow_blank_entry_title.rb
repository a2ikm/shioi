class AllowBlankEntryTitle < ActiveRecord::Migration
  def change
    change_column_null :entries, :title, true
  end
end
