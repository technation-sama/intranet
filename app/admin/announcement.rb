ActiveAdmin.register Announcement do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :title, :content
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
  column :id
  column :title
  column :content do |desc|
     truncate(desc.content,length: 200,:omission => "..." , :separator => ' ', :escape => false)
  end
   actions
end

show do
    h3 announcement.title
    div do
      simple_format announcement.content
    end
  end
form do |f|
    f.inputs  do
      f.input :title
      f.input :content, :as => :ckeditor
    end
      actions
  end

end
