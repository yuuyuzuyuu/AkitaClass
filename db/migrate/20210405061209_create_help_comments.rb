class CreateHelpComments < ActiveRecord::Migration[5.2]
  def change
    create_table :help_comments do |t|
      t.integer :user_id, null: false
      t.integer :help_post_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
