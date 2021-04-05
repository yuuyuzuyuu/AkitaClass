class Users::HelpPostsController < ApplicationController

  def index
    @help_posts = HelpPost.all
  end

  def show
    @help_post = HelpPost.find(params[:id])
  end

  def new
    @help_post = HelpPost.new
  end

  def create
    @help_post = HelpPost.new(help_post_params)
    @help_post.user_id = current_user.id
    @help_post.save
    redirect_to help_post_path(@help_post.id)
  end

  def edit
    @help_post = HelpPost.find(params[:id])
  end

  def update
    @help_post = HelpPost.find(params[:id])
    if @help_post.update(help_post_params)
      redirect_to help_post_path
    else
      render :edit
    end
  end

  def destroy    
    @help_post = HelpPost.find(params[:id])
    @help_post.destroy
    redirect_to help_posts_path
  end

  private

  def help_post_params
    params.require(:help_post).permit(:title, :body, :post_image, :genre_id)
  end
end
