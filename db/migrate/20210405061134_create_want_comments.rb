class CreateWantComments < ActiveRecord::Migration[5.2]
  def change
    create_table :want_comments do |t|
      
      t.integer :user_id
      t.integer :help_post_id
      t.text :comment

      t.timestamps
    end
  end
end
