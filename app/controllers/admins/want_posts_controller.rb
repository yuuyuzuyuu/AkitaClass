class Admins::WantPostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @want_posts = WantPost.all
  end
  
  def show
    @want_post = WantPost.find(params[:id])
  end
  
  def destroy
    @want_post = WantPost.find(params[:id])
    @want_post.destroy
    redirect_to admins_want_posts_path
  end
end
