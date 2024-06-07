class AssignementsController < ApplicationController
  before_action :set_assignement, only: [:show, :edit, :update, :destroy]
  before_action :set_document, only: [:new, :create, :edit, :update]

  def index
    @assignements = Assignement.all
  end

  def show
    if @assignements.nil?
      redirect_to documents_path, alert: "Assignement not found"
    end
  end

  def new
    @assignement = @document.assignements.new
    @users = User.all
  end

  def create
    @assignement = @document.assignements.new(assignement_params)
    @group = @document.group
    if @assignement.save
      redirect_to group_document_path(@group, @document), notice: 'Assignement was successfully created.'
    else
      @users = User.all
      render :new
    end
  end

  def edit
  end

  def update
    if @assignement.update(assignement_params)
      redirect_to document_path(@document), notice: "Assignement was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @assignement.destroy
    redirect_to document_path(@document), notice: "Assignement was successfully destroyed."
  end

  private

  def set_assignement
    @assignement = Assignement.find(params[:id])
  end

  def set_document
    @document = Document.find(params[:document_id])
  end

  def assignement_params
    params.require(:assignement).permit(:user_id, :document_id, :comment)
  end
end
