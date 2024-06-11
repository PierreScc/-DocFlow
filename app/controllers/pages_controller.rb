class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @document = Document.new
    @group = Group.new
    @documents = current_user.documents
    @groups = current_user.groups
  end

end
