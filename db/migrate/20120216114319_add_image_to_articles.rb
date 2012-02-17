class AddImageToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :cover_image_uid, :string

    add_column :articles, :cover_image_name, :string

  end
end
