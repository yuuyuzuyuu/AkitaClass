class CreateWantPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :want_posts do |t|
      
      t.integer :user_id, null: false
      t.integer :genre_id
      t.string :title, null: false
      t.text :body, null: false
      t.text :requirement
      t.string :post_image_id

      t.timestamps
    end
  end
end
