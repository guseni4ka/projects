class AlterTableArticlesAddFieldPublishedAt < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.column :published_at, :date
      t.index :published_at
    end
  end
end
