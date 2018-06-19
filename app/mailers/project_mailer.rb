class ProjectMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.newproject.subject
  #
  def newproject(project)
    @project = project
    @user = user
      mail(
        to:       user.joins(:publications).where(publications: {category_id: project.category_id}),
        subject:  "Un nouvel appel à projet sur FondaBase !"
      )
  end

end
