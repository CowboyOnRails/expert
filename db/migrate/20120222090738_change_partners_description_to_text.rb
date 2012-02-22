class ChangePartnersDescriptionToText < ActiveRecord::Migration
  def up
  	change_column :partners, :description, :text
  end

  def down
  	change_column :partners, :description, :string
  end
end
