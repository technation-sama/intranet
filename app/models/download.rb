class Download < ApplicationRecord
  belongs_to :category
  mount_uploader :document, DocumentUploader
end
