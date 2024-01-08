class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit show update]

  def show
    @diagnoses = current_user.diagnoses
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: ('プロフィール更新に成功しました！')
    else
      flash.now[:danger] = ('プロフィール更新に失敗しました')
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar_image, :avatar_image_cache)
  end
end
