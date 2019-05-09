ActiveAdmin.register Project do
  permit_params :title,
                :description,
                :link,
                :expiration,
                :category_id,
                :fondation_id,
                eligible_ids: []

index do
  selectable_column
  id_column
  column :title
  column :description do |descript|
      truncate(descript.description, length: 50)
   end
  column :link
  column :expiration
  column :category_id do |project|
    project.category.title
  end
  column :fondation_id do |project|
    project.fondation.title
  end
  column :eligibles do |project|
    table_for project.eligibles.order('title ASC') do
      column do |eligible|
        eligible.title
      end
    end
  end
  actions
end

show do
  attributes_table do
    row :title
    row :description
    row :link
    row :expiration
    row :category_id do |project|
      project.category.title
    end
    row :fondation_id do |project|
      project.fondation.title
    end
    table_for project.eligibles.order('title ASC') do
      column "Eligibles" do |eligible|
        link_to eligible.title, [ :admin, eligible ]
      end
    end
  end
end

  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :description
      f.input :link
      f.input :expiration
      f.input :category_id
      f.input :fondation_id
      f.input :eligibles, :as => :check_boxes
    end
    f.actions
  end

end
