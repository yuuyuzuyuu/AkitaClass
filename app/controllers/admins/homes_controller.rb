class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @users = User.all
    @want_posts = WantPost.all
    @help_posts = HelpPost.all
  end
  
end
