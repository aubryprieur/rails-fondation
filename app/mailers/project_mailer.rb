class ProjectMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.newproject.subject
  #
  def newproject(project)
    @project = project
      mail(
        to:       mails = User.joins(:publications).where(publications: {category_id: project.category_id}).collect(&:email).join(","),
        subject:  "Un nouvel appel à projet sur FondaBase !"
      )
  end

end
