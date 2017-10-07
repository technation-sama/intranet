ActiveAdmin.register Download do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :title, :document, :category_id
 
 controller do
   def create
    super do |format|
      redirect_to collection_url and return if resource.valid?
    end
  end
  
  def update
    super do |format|
      redirect_to collection_url and return if resource.valid?
    end
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
belongs_to :category
# breadcrumb do
#     [
#       link_to('Categories', ''),
#       link_to('Categories', '')
#     ]
#   end
  
end
