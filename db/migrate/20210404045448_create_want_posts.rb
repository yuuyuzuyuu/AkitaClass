class CreateWantPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :want_posts do |t|

      t.timestamps
    end
  end
end
