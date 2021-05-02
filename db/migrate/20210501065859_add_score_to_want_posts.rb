class AddScoreToWantPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :want_posts, :score, :decimal, precision: 5, scale: 3
  end
end
