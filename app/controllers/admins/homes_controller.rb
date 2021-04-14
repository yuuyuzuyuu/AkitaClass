class Admins::HomesController < ApplicationController
  
  def top
    @users = User.all
    @want_posts = WantPost.all
    @help_posts = HelpPost.all
  end
  
end
