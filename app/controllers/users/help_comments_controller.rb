class Users::HelpCommentsController < ApplicationController
    
  def create
    help_post = HelpPost.find(params[:help_post_id])
    comment = current_user.help_comments.new(help_comment_params)
    comment.help_post_id = help_post.id
    comment.save
    redirect_to help_post_path(help_post)
  end
  
  def destroy
  end
  
  private

  def help_comment_params
    params.require(:help_comment).permit(:comment)
  end
  
end