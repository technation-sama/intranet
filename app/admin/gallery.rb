ActiveAdmin.register Gallery do
  scope :all, default: true
  scope :empty
  permit_params :title, gallery_attachments_attributes: [:id, :gallery_id, :photo]
  filter :title, as: :select
  
  index do
    index_column
    column :title do |gallery|
      link_to gallery.title, admin_gallery_gallery_attachments_path(gallery)
    end
    column :published_at do |publish|
      publish.created_at
    end
    column :image_count do |slug|
      slug.gallery_attachments.size
    end

    actions defaults: false do |gallery|
      item 'Edit Title', edit_admin_gallery_path(gallery), class: 'btn-warning member_link'
      item 'View Gallery', admin_gallery_gallery_attachments_path(gallery), class: 'member_link'
      item 'View on site', gallery_gallery_attachments_path(gallery), class: 'member_link'
      item 'Delete Gallery', admin_gallery_path(gallery), class: 'btn-danger member_link', method: :delete
    end
  end
  
  controller do
    def create
      @gallery = Gallery.new(permitted_params[:gallery])
      if @gallery.save
        if params[:gallery_attachments]
          params[:gallery_attachments]['photo'].each do |pic|
            @gallery_attachment = @gallery.gallery_attachments.create!(photo: pic)
          end
        end
        redirect_to admin_gallery_gallery_attachments_path(@gallery)
      else
        render json: @gallery.errors, status: :unprocessable_entity 
      end
    end
  end
  
  form do |f|
    f.inputs 'Gallery Title' do
      f.input :title
    end
  
    f.inputs 'Gallery Images' do
      f.has_many :gallery_attachments, new_record: 'Upload Images' do |pic|
        pic.input :photo, input_html: { name: "gallery_attachments[photo][]", multiple: true }
      end
    end
    f.actions
  end


end


### ToDo
## Gallery
# Change form for edit
# work on empty