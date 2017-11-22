ActiveAdmin.register Gallery do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  scope :everything, default: true
  permit_params :title, gallery_attachments_attributes: [:id, :gallery_id, :photo]
  
  filter :title
  index do
    selectable_column
    column :title do |post|
      link_to post.title, admin_post_path(post)
    end
    column 'images', :slug do |slug|
      @gallery = Gallery.find_by_slug(slug.to_s)
      #@gallery.gallery_attachments.size
      link_to slug
    end
    actions
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
