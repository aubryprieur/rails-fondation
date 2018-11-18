ActiveAdmin.register Project do
  permit_params :title, :description, :link, :expiration, :category_id, :fondation_id
end



