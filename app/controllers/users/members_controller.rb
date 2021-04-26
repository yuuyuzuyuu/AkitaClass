class Users::MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    if @user.withdraw_status == true
      redirect_to members_withdrawed_path
    else
      @help_posts = HelpPost.all
      @want_posts = WantPost.all
      @help_likes = HelpLike.where(user_id: @user.id)
      @want_likes = WantLike.where(user_id: @user.id)
  
      impressionist(@user)  # プレビュー数を数える
      @page_views = @user.impressionist_count
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path(@user)
    else
      render 'edit'
    end
  end
  
  def unsubscribe
  end
  
  def withdraw
    @user = current_user
    @user.withdraw_status = true
    if @user.save
      reset_session
      redirect_to root_path
    end
  end
  
  def withdrawed
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :email,
                                 :introduce, :birth_date, :address, :profile_image, :contact, :withdraw_status, :instagram, :twitter, :facebook)
  end
end
