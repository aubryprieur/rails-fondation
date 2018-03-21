ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    columns do
      column do
        panel "Accueil :" do
          ul do
            li link_to("Retourner sur le site",projects_path, target: "_blank")
            li link_to("Les appels à projets (créer, éditer ou effacer)", admin_projects_path)
            li link_to("Les catégories (créer, éditer ou effacer)", admin_categories_path)
            li link_to("Les publics éligibles (créer, éditer ou effacer)", admin_eligibles_path)
            li link_to("Les fondations (créer, éditer ou effacer)", admin_fondations_path)
            li link_to("Relation appels à projet/publics éligibles (créer, éditer ou effacer)", admin_project_eligibles_path)
          end
        end
      end
    # Here is an example of a simple dashboard with columns and panels.
    #

      column do
        panel "Les derniers ajouts d'appel à projet :" do
          ul do
            Project.last(5).map do |project|
              li link_to(project.title, project_path(project), target: "_blank")
            end
          end
        end
      end

      # column do
      #   panel "Info" do
      #     para "Welcome to ActiveAdmin."
      #   end
      # end

  end
  end # content
end
