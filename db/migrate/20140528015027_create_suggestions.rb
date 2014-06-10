class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :user_id
      t.string :target
      t.string :title
      t.text :body
      t.integer :score
      t.boolean :local

      t.timestamps
    end
  end
end
