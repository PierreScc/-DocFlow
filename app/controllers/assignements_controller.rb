class AssignementsController < ApplicationController
  before_action :set_assignement, only: [:show, :edit, :update, :destroy]
  before_action :set_document, only: [:new, :create, :edit, :update]

  def index
    @assignements = Assignement.all
  end

  def show
    if @assignement.nil?
      redirect_to documents_path, alert: "Assignement not found"
    end
  end

  def new
    @assignement = @document.assignements.new
    @users = User.all
  end

  def create
    @group = @document.group
    user_ids = assignement_params[:user_ids].reject(&:blank?)
    errors = false

    user_ids.each do |user_id|
      @assignement = @document.assignements.new(user_id: user_id, comment: assignement_params[:comment])
      unless @assignement.save
        errors = true
        @users = User.all
        render :new
      end
    end

    unless errors
      redirect_to group_document_path(@group, @document), notice: 'Assignements were successfully created.'
    end
  end

  def edit
  end

  def update
    if @assignement.update(assignement_params)
      redirect_to group_document_path(@document.group, @document), notice: "Assignement was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @assignement.destroy
    redirect_to group_document_path(@document.group, @document), notice: "Assignement was successfully destroyed."
  end

  private

  def set_assignement
    @assignement = Assignement.find(params[:id])
  end

  def set_document
    @document = Document.find(params[:document_id])
  end

  def assignement_params
    params.require(:assignement).permit({ user_ids: [] }, :comment)
  end
end
