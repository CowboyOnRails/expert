class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :subject
      t.text :body

      t.timestamps
    end
  end
end
