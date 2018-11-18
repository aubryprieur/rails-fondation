class ProjectMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.newproject.subject
  #
  def newproject(project)
    @project = project
    puts "##################################"
    puts project.inspect
    puts project.project_eligibles.inspect
    puts "##################################"
    proj_elig = ProjectEligible.where('project_id =?', project.id).pluck(:eligible_id)
    puts "##################################"
    puts proj_elig.inspect
    puts "##################################"
    mails = User.includes(:publications).where("publications.category_id = ?", project.category_id).pluck(:email)
      mail(
        to: mails,
        subject:  "Un nouvel appel à projet sur FondaBase !"
      )
  end
end
