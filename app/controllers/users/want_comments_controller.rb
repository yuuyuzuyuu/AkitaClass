class Users::WantCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @want_post = WantPost.find(params[:want_post_id])
    @want_comment = current_user.want_comments.new(want_comment_params)
    @want_comment.want_post_id = @want_post.id
    @want_comment.save
  end
  
  def destroy
    @want_post = WantPost.find(params[:want_post_id])
    want_comment = @want_post.want_comments.find(params[:id])
    want_comment.destroy
  end
  
  private

  def want_comment_params
    params.require(:want_comment).permit(:comment)
  end
  
end