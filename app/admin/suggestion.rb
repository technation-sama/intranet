ActiveAdmin.register Suggestion do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
filter :subject
filter :created_at
config.clear_action_items!

controller do
   def destroy
    super do |format|
      flash[:notice] = "This is a test notice!"
      redirect_to collection_url and return if resource.valid?
    end
  end
end
 
index do
    index_column
    column :subject
    column :message
    actions defaults: false do |action|
      item 'View', admin_suggestion_path(action), class: 'btn-warning member_link'
      item 'Delete',  admin_suggestion_path(action),method: :delete, data: {confirm: "Are you sure yu want to delete this record?"}, class: 'btn-warning member_link'
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
