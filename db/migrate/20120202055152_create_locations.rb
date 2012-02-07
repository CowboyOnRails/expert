class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :adress
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
