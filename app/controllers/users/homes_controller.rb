class Users::HomesController < ApplicationController
  def top
    @help_posts = HelpPost.order(created_at: :desc).limit(3)
  end
  
  def about
  end
end
