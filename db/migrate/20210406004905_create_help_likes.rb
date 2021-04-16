class CreateHelpLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :help_likes do |t|
      
      t.integer :user_id
      t.integer :help_post_id

      t.timestamps
    end
  end
end
