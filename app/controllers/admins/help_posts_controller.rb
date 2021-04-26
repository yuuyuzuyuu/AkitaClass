class Admins::HelpPostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @help_posts = HelpPost.all
  end
  
  def show
    @help_post = HelpPost.find(params[:id])
  end
  
  def destroy
    @help_post = HelpPost.find(params[:id])
    @help_post.destroy
    redirect_to admins_help_posts_
  end
end
