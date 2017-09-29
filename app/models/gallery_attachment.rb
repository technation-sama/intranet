class GalleryAttachment < ApplicationRecord
  belongs_to :gallery, touch: true
  mount_uploader :photo, PhotoUploader
end
