class CreateNewsposts < ActiveRecord::Migration
  def change
    create_table :newsposts do |t|
      t.string :name, :null=>false
      t.text :body
      t.date :posted
      t.integer :metaitem_id, :default => 1

      t.timestamps
    end
    add_index :newsposts, :metaitem_id
    add_index :newsposts, :posted
  end
end
