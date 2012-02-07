class CreateMetaitems < ActiveRecord::Migration
  def change
    create_table :metaitems do |t|
      t.string :title
      t.text :description
      t.text :keywords
      t.references :page, :polymorphic => true

      t.timestamps
    end
    add_index :metaitems, :page_id
  end
end
