class AddSitenameToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :sitename, :string

  end
end
