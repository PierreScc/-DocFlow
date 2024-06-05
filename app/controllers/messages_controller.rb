class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy, :create, :new]
  before_action :set_user, only: [:new, :create, :edit, :update]
  before_action :authenticate_user!

  def index
    @messages = Message.all
  end

  def show
    if @message.nil?
      redirect_to messages_path, alert: "Message not found"
    end
  end

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

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to message_path(@message), notice: "Message was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_path, notice: "Message was successfully destroyed."
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def message_params
    params.require(:message).permit(:user_id, :group_id, :content)
  end
end
