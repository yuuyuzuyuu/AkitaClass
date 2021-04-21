class Users::HelpPostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = HelpPost.ransack(params[:q])
    @help_posts = @q.result(distinct: true)
    @genres = Genre.all
  end

  def show
    @help_post = HelpPost.find(params[:id])
    @help_comment = HelpComment.new
    @help_comments = HelpComment.all
  end

  def new
    @help_post = HelpPost.new
  end

  def create
    @help_post = HelpPost.new(help_post_params)
    @help_post.user_id = current_user.id
    if @help_post.save
      redirect_to help_post_path(@help_post.id)
    else
      render :new
    end
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

  def tag
    @tags = HelpPost.tag_counts_on(:tags).order('count DESC')
    if params[:tag].present?
      @tag = params[:tag]
      @help_posts = HelpPost.tagged_with(params[:tag])
    else
      @help_posts = HelpPost.all
    end
  end

    # nameカラムがparams[:key]から始まる、Tagsテーブルのレコードを全取得
  def get_tag_search
    @tags = HelpPost.tag_counts_on(:tags).where('name LIKE(?)', "%#{params[:key]}%")
  end

  private

  def help_post_params
    params.require(:help_post).permit(:title, :user_id, :body, :post_image, :genre_id, :tag_list, :contact, :active_status)
  end

end
