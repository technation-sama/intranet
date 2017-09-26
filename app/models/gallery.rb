class Gallery < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged
	validates :title, presence: true
	has_many :gallery_attachments, dependent: :destroy
	accepts_nested_attributes_for :gallery_attachments

	def self.GalleryQuery(page_param)
		includes(:gallery_attachments).page(page_param).per(20)
	end
end
