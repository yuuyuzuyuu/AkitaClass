class AddScoreToHelpPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :help_posts, :score, :decimal, precision: 5, scale: 3
  end
end
