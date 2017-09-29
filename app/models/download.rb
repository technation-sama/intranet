class Download < ApplicationRecord
  belongs_to :category
  mount_uploader :document, DocumentUploader
  validates :title, :document, :category_id , presence: true
end
