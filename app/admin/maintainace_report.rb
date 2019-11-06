ActiveAdmin.register MaintainaceReport do
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
filter :category
filter :created_at
config.clear_action_items!
menu :label => "Mainatainance Responses"

index do
    index_column
    column :user_id
    column :location
    column :category
    column :description
    column :created_at
    actions defaults: false do |action|
      item 'View', admin_maintainace_report_path(action), class: 'btn-warning member_link'
    end
end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
