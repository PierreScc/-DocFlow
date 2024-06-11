class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def show
    @messages = @group.messages.order(created_at: :asc)
    @message = Message.new
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      UserGroup.create!(user: current_user, group: @group)
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

  def group_params
    params.require(:group).permit(:title, :photo, :category)
  end
end
