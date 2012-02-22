class AddIndexToArticlesAddon < ActiveRecord::Migration
  def change
  	add_index :articles, :addon
  end
end
