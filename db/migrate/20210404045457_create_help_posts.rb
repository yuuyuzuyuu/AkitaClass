class CreateHelpPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :help_posts do |t|
      
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.string :post_image_id
      t.boolean :active_status, default: true, null: false

      t.timestamps
    end
  end
end
