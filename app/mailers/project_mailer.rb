class ProjectMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.newproject.subject
  #
  def newproject(project)
    @project = project
    project_eligibles = ProjectEligible.where("project_id =?", @project.id).pluck(:eligible_id)
    mails = User.includes(:publications).where("publications.category_id = ? ", @project.category_id).pluck(:email)
      mail(
        to: mails,
        subject:  "Un nouvel appel à projet sur FondaBase !"
      )
  end
end
