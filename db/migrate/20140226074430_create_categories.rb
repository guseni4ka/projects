class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :title,     null: false, limit: 255
      t.string  :slug,      null: false, limit: 255
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
    add_index :categories, :is_active
    add_index :categories, :slug, unique: true
  end
end
