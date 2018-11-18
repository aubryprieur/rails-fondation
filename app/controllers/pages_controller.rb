class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :favorites

  def home
    @fondations = Fondation.all
    @projects = Project.all
  end

  private

  def favorites
    if current_user
      @favorite_projects = current_user.favorite_projects
    end
  end

end
