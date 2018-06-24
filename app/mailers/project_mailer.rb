class ProjectMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.newproject.subject
  #
  def newproject(project)
    @project = project
    project_eligibles = ProjectEligible.where("project_id =?", project.id).pluck(:eligible_id)
      mail(
        to:       User.includes(:publications).where("publications.category_id =? AND publications.eligible_id =? ", @project.category_id, project_eligibles).pluck(:email),
        subject:  "Un nouvel appel à projet sur FondaBase !"
      )
  end

end
