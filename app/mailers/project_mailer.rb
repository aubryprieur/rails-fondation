class ProjectMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.newproject.subject
  #
  def newproject(project)
    @project = project
    users = User.where(@publication.category === @project.category)
      mail(
        to:       emails = users.collect(&:email).join(", "),
        subject:  "Un nouvel appel à projet sur FondaBase !"
      )
  end

end
