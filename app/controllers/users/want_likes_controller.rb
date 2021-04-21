class Users::WantLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @want_post = WantPost.find(params[:want_post_id])
    want_like = current_user.want_likes.new(want_post_id: @want_post.id)
    want_like.save
  end

  def destroy
    @want_post = WantPost.find(params[:want_post_id])
    want_like = current_user.want_likes.find_by(want_post_id: @want_post.id)
    want_like.destroy
  end
end
