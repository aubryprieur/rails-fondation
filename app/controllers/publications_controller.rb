class PublicationsController < ApplicationController
  before_action :set_publication, only: [:edit, :destroy]
  before_action :favorites

  def index
    @publications = Publication.all
    @eligibles = Eligible.all
    @categories = Category.all
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)
    @publication.user = current_user
    if @publication.save
      redirect_to publications_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @publication.destroy
    redirect_to publications_path
  end

  private

  def set_publication
    @publication = Publication.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(:category_id, :eligible_id)
  end

  def favorites
    @favorite_projects = current_user.favorite_projects
  end

end
