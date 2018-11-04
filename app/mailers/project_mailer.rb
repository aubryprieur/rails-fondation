class ProjectMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.newproject.subject
  #
  def newproject(project)
    @project = project
      mail(
        to: User.includes(:publications).where("publications.eligible_id IN (?) AND publications.category_id = ?", project.project_eligibles[0].eligible_id, @project.category_id).pluck(:email),
        subject:  "Un nouvel appel à projet sur FondaBase !"
      )
  end
end
