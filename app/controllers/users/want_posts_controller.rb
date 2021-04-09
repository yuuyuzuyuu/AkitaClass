class Users::WantPostsController < ApplicationController
  
  def index
    @want_posts = WantPost.all
  end

  def show
    @want_post = WantPost.find(params[:id])
    @want_comment = WantComment.new
    @want_comments = WantComment.all
  end

  def new
    @want_post = WantPost.new
  end

  def create
    @want_post = WantPost.new(want_post_params)
    @want_post.user_id = current_user.id
    @want_post.save
    redirect_to want_post_path(@want_post.id)
  end

  def edit
    @want_post = WantPost.find(params[:id])
  end

  def update
    @want_post = WantPost.find(params[:id])
    if @want_post.update(want_post_params)
      redirect_to want_post_path
    else
      render :edit
    end
  end

  def destroy    
    @want_post = WantPost.find(params[:id])
    @want_post.destroy
    redirect_to want_posts_path
  end

  private

  def want_post_params
    params.require(:want_post).permit(:title, :body, :post_image, :genre_id, :requirement)
  end
  
  def post_params
    params.require(:post).permit(:title, :body, :tag_list)
  end
  
end
