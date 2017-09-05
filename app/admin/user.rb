ActiveAdmin.register User do
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
actions :all, :except => [:destroy, :update, :edit]
config.per_page = 20
index do
  selectable_column
  column :image do |ad|
      image_tag ad.image, height: '30px'
    end
  column :email
  column :name
  column :profile
  column :gender
  actions
end
filter :name, as: :select
config.clear_action_items!
end
