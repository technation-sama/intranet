ActiveAdmin.register Gallery do
  ActiveAdmin.register GalleryAttachment do
    belongs_to :gallery, optional: true
  end

  scope :all, default: true
  scope :empty
  permit_params :title, gallery_attachments_attributes: [:id, :gallery_id, :photo]
  
  filter :title

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

    actions do |gallery|
      a "View in page", href: gallery_gallery_attachments_path(gallery), class: "member_link"
    end
  end
  
  action_item only: :show do
    @gallery = Gallery.friendly.find(params[:id])
    link_to 'View on site', gallery_gallery_attachments_path(@gallery)
  end
  
  controller do
    def find_resource
      begin
        scoped_collection.where(slug: params[:id]).first!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
    
    def create
      @gallery = Gallery.new(permitted_params[:gallery])
      if @gallery.save
        if params[:gallery_attachments]
          params[:gallery_attachments]['photo'].each do |pic|
            @gallery_attachment = @gallery.gallery_attachments.create!(photo: pic)
          end
        end
        redirect_to gallery_gallery_attachments_path(@gallery)
      else
        render json: @gallery.errors, status: :unprocessable_entity 
      end
    end
  end

end
