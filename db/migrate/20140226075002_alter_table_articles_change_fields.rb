class AlterTableArticlesChangeFields < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.change :title, :string, null: false, limit: 255
      t.change :text, :text, null: false
    end
  end
end
