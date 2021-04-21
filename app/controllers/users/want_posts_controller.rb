class Users::WantPostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = WantPost.ransack(params[:q])
    @want_posts = @q.result(distinct: true)
    @genres = Genre.all
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
    if @want_post.save
      redirect_to want_post_path(@want_post.id)
    else
      render :new
    end
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

  def tag
    @tags = WantPost.tag_counts_on(:tags).order('count DESC')
    if params[:tag].present?
      @tag = params[:tag]
      @want_posts = WantPost.tagged_with(params[:tag])
    else
      @want_posts = WantPost.all
    end
  end

  # nameカラムがparams[:key]から始まる、Tagsテーブルのレコードを全取得
  def get_tag_search
    @tags = WantPost.tag_counts_on(:tags).where('name LIKE(?)', "%#{params[:key]}%")
  end

  def town
    @want_posts = WantPost.all
    @town = Town.find(params[:id]) if params[:id]
    @towns = Town.all
  end

  private

  def want_post_params
    params.require(:want_post).permit(:title, :body, :post_image, :genre_id, :town_id, :url, :requirement, :tag_list, :active_status, :contact)
  end

end
