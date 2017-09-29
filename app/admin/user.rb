ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params  :email, :admin, :role
 
 controller do
    def update
      @user = User.find(params[:id])
      if params[:user][:password].blank?
        @user.update_without_password(params[:user])
      else
        @user.update_attributes(params[:user])
      end
      if @user.errors.blank?
        redirect_to admin_users_path, :notice => "User updated successfully."
      else
        render :edit
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
    status_tag (role.nil? ? role : "Agent"), (role.nil? ? :ok : :error)
  end
  actions
end
filter :name, as: :select
config.clear_action_items!


 form do |f|
    f.inputs "Make User an admin" do
      f.input :email
      f.input :admin, :label => "Administrator"
      f.input :role, :label => 'User Role', :as => :select, :collection => User::ROLES.map{|u| [u,u]}
      # f.input :password, :input_html => { :value => "password" }, as: :hidden
      # f.input :password_confirmation, :input_html => { :value => "password" }, as: :hidden
      # f.input :current_password, :input_html => { :value => "password" }, as: :hidden
    end
      actions
  end


  create_or_edit = Proc.new {
    @user            = User.find_or_create_by(:id=>params[:id])
    @user.admin = params[:user][:admin]
    @user.attributes = params[:user].delete_if do |k, v|
      (k == "admin") ||
      (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
    end
    if @user.save
      redirect_to :action => :show, :id => @user.id
    else
      render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit



end
