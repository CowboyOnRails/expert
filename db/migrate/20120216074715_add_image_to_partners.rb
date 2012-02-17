class AddImageToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :cover_image_uid, :string

    add_column :partners, :cover_image_name, :string

  end
end
