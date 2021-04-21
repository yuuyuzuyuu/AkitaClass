class Users::HomesController < ApplicationController
  def top
    @help_posts = HelpPost.order(created_at: :desc).limit(3)
    @want_posts = WantPost.order(created_at: :desc).limit(3)
    @help_ranks = HelpPost.find(HelpLike.group(:help_post_id).order('count(help_post_id) desc').limit(3).pluck(:help_post_id))
    @want_ranks = WantPost.find(WantLike.group(:want_post_id).order('count(want_post_id) desc').limit(3).pluck(:want_post_id))
  end

  def about; end
end
