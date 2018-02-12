require 'date'

class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]



  def index
    @search = Search.new(search_params)
    @categories = Category.all
    @eligibles = Eligible.all

    session[:search] = params[:search] if params[:search].present?
    request = Project

    return @projects = request.order("expiration ASC").paginate(:page => params[:page], :per_page => 2) unless session[:search].present?

    request = request.where('expiration > ?', Date.today)
    request = request.where(category: session[:search]['category']) if session[:search]['category'].present?
    request = request.joins(:project_eligibles).where(project_eligibles: {eligible_id: session[:search]['eligible']}) if session[:search]['eligible'].present?

    @projects = request.page(params[:page]).order("expiration ASC").paginate(:page => params[:page], :per_page => 2)
  end


  def show
  end

  def new
    @project = Project.new
  end


  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy

    redirect_to projects_path
  end

    private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :link, :expiration, :all_tags, :category_id, :fondation_id, eligible_ids: [])
  end

  def search_params
    if params[:search].present?
      p = params.require(:search).permit!
      session[:search] = p
    else
      session[:search]
    end
  end

end
