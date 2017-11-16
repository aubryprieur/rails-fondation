class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @search = Search.new(search_params)
    @categories = Category.all
    if params[:category].present?
       @projects = @projects.category(params[:category])
    else
      @projects = Project.where(nil).order("expiration ASC")
    end

    # if params[:tag]
    #   @projects = Project.tagged_with(params[:tag])
    # else
    #   @projects = Project.all.order("expiration ASC")
    # end
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
    params.require(:project).permit(:title, :description, :link, :expiration, :all_tags, :category_id, :fondation_id)
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
