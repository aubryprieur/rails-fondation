class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :favorites

  def home
  end

  private

  def favorites
    @favorite_projects = current_user.favorite_projects
  end

end
