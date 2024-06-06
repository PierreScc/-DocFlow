class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = Document.all
  end

  def show
    if @document.nil?
      redirect_to documents_path, alert: "Document not found"
    end
  end

  def new
    @document = @group.documents.build
  end

  def create
    @document = Document.new(document_params)
    @document.user = current_user
    if @document.save!
      redirect_to group_document_path(@document.group, @document), notice: "Document was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @document.update(document_params)
      redirect_to document_path(@document), notice: "Document was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_path, notice: "Document was successfully destroyed."
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:title, :group_id, :category, :comment, :photo)
  end
end
