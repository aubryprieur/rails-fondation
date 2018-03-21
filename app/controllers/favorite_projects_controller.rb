class FavoriteProjectsController < ApplicationController
  before_action :set_project, only: [:create, :destroy]

  def index
    @projects = current_user.favorite_projects
  end

  def create
    if Favorite.create(favorited: @project, user: current_user)
      redirect_to favorites_path, notice: "L'appel à projet à été ajouté dans vos favoris"
    else
      redirect_to projects_path, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Favorite.where(favorited_id: @project.id, user_id: current_user.id).first.destroy
    redirect_to favorites_path, alert: "L'appel à projet a été supprimé de vos favoris"
  end

  private

  def set_project
    @project = Project.find(params[:project_id] || params[:id])
  end
end
