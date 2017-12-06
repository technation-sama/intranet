ActiveAdmin.register GalleryAttachment do
  belongs_to :gallery, optional: true
  before_filter :skip_sidebar!
  menu false
  permit_params :gallery_id, :photo
  actions :all, except: [:show, :edit]


  index do
    column :photo do |pic|
      image_tag pic.photo, class: "admin-thumb-image"
    end
    actions
  end

  controller do
    def create
      @gallery = Gallery.find(params[:gallery_id])
      @gallery_attachment = @gallery.gallery_attachments.create(permitted_params[:gallery_attachment])

      respond_to do |format|
        if @gallery_attachment.save
          format.html { redirect_to admin_gallery_gallery_attachments_path(@gallery) }
          format.json { render json, status: :created, location: @gallery }
        else
          format.html { render :new }
          format.json { render json: @gallery_attachment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

end

### ToDo
## Gallery attachments
# image should link to show page
# view button should read 'view on page' and lead to page
# remove edit button
# remove 'new gallery att*'
# controller for delete, edit
