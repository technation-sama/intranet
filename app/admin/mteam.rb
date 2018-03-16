ActiveAdmin.register Mteam do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

permit_params :title, :question
filter :title
filter :created_at
config.clear_action_items!
menu :label => "M-Team Questions"

index do
    index_column
    column :title
    column :question
    actions defaults: false do |action|
      item 'View', admin_mteam_path(action), class: 'btn-warning member_link'
      item 'Delete',  admin_mteam_path(action),method: :delete, data: {confirm: "Are you sure yu want to delete this record?"}, class: 'btn-warning member_link'
    end
end

end
