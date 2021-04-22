class Users::MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @help_posts = HelpPost.all
    @want_posts = WantPost.all
    @help_likes = HelpLike.where(user_id: @user.id)
    @want_likes = WantLike.where(user_id: @user.id)

    impressionist(@user)  # プレビュー数を数える
    @page_views = @user.impressionist_count
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

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :email,
                                 :introduce, :birth_date, :address, :profile_image, :contact, :withdraw_status, :instagram, :twitter, :facebook)
  end
end
