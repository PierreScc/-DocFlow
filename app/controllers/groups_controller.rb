class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create, :edit, :update]

  def index
    @groups = Group.all
  end

  def show
    if @group.nil?
      redirect_to groups_path, alert: "Group not found"
    end
  end

  def create
    @group = Group.new(group_params)
    @group.user = @user
    if @group.save
      redirect_to group_path(@group), notice: "Group was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group), notice: "Group was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, notice: "Group was successfully destroyed."
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def group_params
    params.require(:group).permit(:title, :document_id, :category)
  end
end
