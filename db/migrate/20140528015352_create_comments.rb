class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :owner_id
      t.integer :suggestion_id
      t.integer :vote
      t.text :body

      t.timestamps
    end
  end
end
