class ProjectMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.newproject.subject
  #
  def newproject(project)
    @project = project
    @users = User.all

    @users.each do |user|
      mail(
        to:       user.email,
        subject:  "Un nouvel appel à projet sur FondaBase !"
      )
    end
  end

end
