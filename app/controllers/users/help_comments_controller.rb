class Users::HelpCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @help_post = HelpPost.find(params[:help_post_id])
    @help_comment = current_user.help_comments.new(help_comment_params)
    @help_comment.help_post_id = @help_post.id
    @help_comment.save
  end

  def destroy
    @help_post = HelpPost.find(params[:help_post_id])
    help_comment = @help_post.help_comments.find(params[:id])
    help_comment.destroy
  end

  private

  def help_comment_params
    params.require(:help_comment).permit(:comment)
  end
end
