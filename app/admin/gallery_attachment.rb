ActiveAdmin.register GalleryAttachment do
  belongs_to :gallery, optional: true
  before_filter :skip_sidebar!
  menu false

  index do
    column :photo do |pic|
      image_tag pic.photo, class: "admin-thumb-image"
    end
    actions
  end

  action_item only: :index do
    link_to "Add Photo to Gallery", new_admin_gallery_gallery_attachment_path
	end

end

### ToDo
## Gallery attachments
# image should link to show page
# view button should read 'view on page' and lead to page
# remove edit button
# remove 'new gallery att*'
# controller for delete, edit
