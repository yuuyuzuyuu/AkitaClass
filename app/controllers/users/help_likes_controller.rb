class Users::HelpLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    help_post = HelpPost.find(params[:help_post_id])
    help_like = current_user.help_likes.new(help_post_id: help_post.id)
    help_like.save
    redirect_to help_post_path(help_post)
  end

  def destroy
    help_post = HelpPost.find(params[:help_post_id])
    help_like = current_user.help_likes.find_by(help_post_id: help_post.id)
    help_like.destroy
    redirect_to help_post_path(help_post)
  end

end
