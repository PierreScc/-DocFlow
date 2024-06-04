class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy, :create, :new]
  before_action :set_user, only: [:new, :create, :edit, :update]

  def index
    @messages = Message.all
  end

  def show
    if @message.nil?
      redirect_to messages_path, alert: "Message not found"
    end
  end

  def create
    @message = Message.new(message_params)
    @message.user = @user
    if @message.save
      redirect_to message_path(@message), notice: "Message was successfully created."
    else
      render :new, status: :unprocessable_entity
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
