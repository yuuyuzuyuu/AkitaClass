class Users::WantCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    want_post = WantPost.find(params[:want_post_id])
    comment = current_user.want_comments.new(want_comment_params)
    comment.want_post_id = want_post.id
    comment.save
    redirect_to want_post_path(want_post)
  end
  
  def destroy
    WantComment.find_by(id: params[:id], want_post_id: params[:want_post_id]).destroy
    redirect_to want_post_path(params[:want_post_id])  
  end
  
  private

  def want_comment_params
    params.require(:want_comment).permit(:comment)
  end
  
end