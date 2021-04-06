class CreateWantLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :want_likes do |t|
      t.integer :user_id
      t.integer :want_post_id

      t.timestamps
    end
  end
end
