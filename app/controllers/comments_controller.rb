class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :create, :update, :destroy]
  before_action :set_document, only: [:new, :create, :edit, :update]

  def index
    @comments = Comment.all
  end

  def show
    if @comment.nil?
      redirect_to documents_path, alert: "Comment not found"
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.document = @document
    @comment.user = current_user
    if @comment.save
      redirect_to document_path(@document), notice: "Comment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to document_path(@document), notice: "Comment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to document_path(@document), notice: "Comment was successfully destroyed."
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_document
    @document = Document.find(params[:document_id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :document_id)
  end
end
