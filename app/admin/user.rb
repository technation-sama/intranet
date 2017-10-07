ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params  :email, :admin, :role
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

controller do
  def update
    super do |format|
      redirect_to collection_url and return if resource.valid?
    end
  end
end

actions :all, :except => [:destroy]
config.per_page = 20

index do
  selectable_column
  column :image do |ad|
      image_tag ad.image, height: '30px'
    end
  column :email
  column :name
  column :gender
  column "Is Admin?", :admin do |admin|
  status_tag (admin.admin ? "Yes" : "No"), (admin.admin ? :ok : :error)
  end
  column "Administrator role", :role do |role|
    status_tag (role.role ? role.role : "Agent"), (role.role ? :ok : :error)
  end
  actions
end

# users show
show do
  panel "Showing #{user.name}'s profile" do
    attributes_table_for user do
      row :image do |ad|
          image_tag ad.image, height: '50px'
        end
      row :role
    end
    end
end

filter :name, as: :select
config.clear_action_items!

 form do |f|
    f.inputs "Make User an admin" do
      f.input :email
      f.input :admin, :label => "Administrator"
      f.input :role, :label => 'User Role', :as => :select, :collection => User::ROLES.map{|u| [u,u]}
    end
      f.actions
  end
  
end
