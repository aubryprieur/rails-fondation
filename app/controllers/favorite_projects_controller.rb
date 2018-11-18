class FavoriteProjectsController < ApplicationController
  before_action :set_project, only: [:create, :destroy]
  before_action :favorites

  def index
    @projects = current_user.favorite_projects
  end

  def create
    if Favorite.create(favorited: @project, user: current_user)
      redirect_to projects_path, notice: "L'appel à projet ' #{@project.title} ' à été ajouté dans vos favoris"
    else
      redirect_to projects_path, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Favorite.where(favorited_id: @project.id, user_id: current_user.id).first.destroy
    redirect_to favorites_path, alert: "L'appel à projet ' #{@project.title} ' a été supprimé de vos favoris"
  end

  private

  def set_project
    @project = Project.find(params[:project_id] || params[:id])
  end

  def favorites
    @favorite_projects = current_user.favorite_projects
  end

end
