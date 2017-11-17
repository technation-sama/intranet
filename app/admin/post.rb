ActiveAdmin.register Post do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :title, :description, :image, :user_id, :featured, :published
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

#actions :all, :except => [:edit]

action_item :view, only: :show do
  link_to 'View on site', post_path(post), target: :_blank if post.published
end

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
 
index do
  selectable_column
  column :title
  column :description do |desc|
     truncate(desc.description,length: 300,:omission => "..." , :separator => ' ', :escape => false)
  end
  column "Created By", :user_id do |user|
     link_to user.user.name, admin_user_path(user)
  end
  column "Featured?", :featured do |featured|
  status_tag (featured.featured ? "Yes" : "No"), (featured.featured ? :ok : :error) 
  end
  column "Published?", :published do |published|
  status_tag (published.published ? "Yes" : "No"), (published.published ? :ok : :error) 
  end
  actions
end

show do
    h1 post.title
    div do
      simple_format post.description
    end
  end

 form do |f|
    f.inputs  do
      f.input :title
      f.input :description, :as => :ckeditor
      # f.input :image, as: :file
      f.input :featured
      f.input :published
    end
      actions
  end
end
