class AddSloganAndHeadToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :slogan, :string

    add_column :articles, :head, :string

  end
end
