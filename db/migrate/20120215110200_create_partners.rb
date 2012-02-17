class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :description

      t.timestamps
    end
  end
end
