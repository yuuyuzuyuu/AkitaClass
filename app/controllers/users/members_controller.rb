class Users::MembersController < ApplicationController
  def show
    @user = current_user
    @help_posts = HelpPost.all
  end
  
  def edit 
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to members_mypage_path
    else
      render "edit"
    end
  end
  
  def unsubscribe
  end
  
  def withdraw
  end
  
  private
  
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :email, :introduce, :birth_date, :phone_number, :address, :profile_image)
  end
end
