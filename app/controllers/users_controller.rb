class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    # Logic for showing user profile
  end

  def edit
    # Logic for editing user profile
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
