ActiveAdmin.register Post do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  selectable_column
  column :title
  column :description do |desc|
     truncate(desc.description, omision: "...", length: 150)
  end
  column "Created By", :user_id do |user|
     link_to user.user.name, admin_user_path(user)
  end
  column "featured?", :featured do |featured|
  status_tag (featured.featured ? "Yes" : "No"), (featured.featured ? :ok : :error) 
  end
  actions
end

 form do |f|
    f.inputs  do
      f.input :title
      f.input :description, :as => :ckeditor
      f.input :image, as: :file
    end
      actions
  end
end
