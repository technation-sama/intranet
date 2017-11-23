ActiveAdmin.register GalleryAttachment do
  belongs_to :gallery, optional: true
  index do
    column :photo do |pic|
      image_tag pic.photo.thumb.url, class: "admin-thumb-image"
    end
    actions
  end
end
