class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy, :create, :new]
  before_action :set_user, only: [:new, :create, :edit, :update]
  before_action :authenticate_user!
  before_action :set_group, only: [:create]

  def create
    @group = Group.find(params[:group_id])
    @message = @group.messages.build(message_params)
    @message.user = current_user
    if @message.save
      redirect_to group_path(@group)
    else
      @messages = @group.messages.order(created_at: :asc)
      render 'groups/show'
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:user_id, :group_id, :content)
  end
end
