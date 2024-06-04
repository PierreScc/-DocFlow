class UserGroupsController < ApplicationController
  before_action :set_user_group, only: [:show, :edit, :update, :destroy, :create]

  def index
    @user_groups = UserGroup.all
  end

  def show
    if @user_group.nil?
      redirect_to user_groups_path, alert: "UserGroup not found"
    end
  end

  def create
    @user_group = UserGroup.new(user_group_params)
    if @user_group.save
      redirect_to user_group_path(@user_group), notice: "UserGroup was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user_group.update(user_group_params)
      redirect_to user_group_path(@user_group), notice: "UserGroup was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user_group.destroy
    redirect_to user_groups_path, notice: "UserGroup was successfully destroyed."
  end

  private

  def set_user_group
    @user_group = UserGroup.find(params[:id])
  end

  def user_group_params
    params.require(:user_group).permit(:user_id, :group_id)
  end
end
