ActiveAdmin.register Poll do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
actions :all, :except => [:destroy, :update, :edit]
permit_params do
    params = [:user_id, :body, :project_name]
    # params.push :author_id if current_user.admin?
    params
end
filter :period, as: :select
config.clear_action_items!
end
