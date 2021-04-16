class Users::HelpCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    help_post = HelpPost.find(params[:help_post_id])
    comment = current_user.help_comments.new(help_comment_params)
    comment.help_post_id = help_post.id
    comment.save
    redirect_to help_post_path(help_post)
  end

  def destroy
    HelpComment.find_by(id: params[:id], help_post_id: params[:help_post_id]).destroy
    redirect_to help_post_path(params[:help_post_id])
  end

  private

  def help_comment_params
    params.require(:help_comment).permit(:comment)
  end

end