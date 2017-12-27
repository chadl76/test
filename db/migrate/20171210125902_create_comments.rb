class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :body
      t.integer :author_id

      t.timestamps
    end
    add_index :comments, :post_id, unique: true
  end
end
