class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name, :null=>false
      t.text :body
      t.integer :position, :null => false, :default => 1
      t.string :addon
      t.integer :parent_id, :null=>false, :default => 0
      t.integer :metaitem_id, :null=>false, :default => 1

      t.timestamps
    end
    add_index :articles, :parent_id
    add_index :articles, :position
    add_index :articles, :metaitem_id
  end
end
