class Gallery < ApplicationRecord
	has_many :gallery_attachments, dependent: :destroy
	accepts_nested_attributes_for :gallery_attachments
end
