class CreateWantComments < ActiveRecord::Migration[5.2]
  def change
    create_table :want_comments do |t|
      
      t.integer :user_id, null: false
      t.integer :want_post_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
