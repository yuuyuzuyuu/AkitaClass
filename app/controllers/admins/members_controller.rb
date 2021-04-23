class Admins::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admins_member_path(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :email,
                                 :introduce, :birth_date, :address, :profile_image, :contact, :withdraw_status, :instagram, :twitter, :facebook)
  end
end
