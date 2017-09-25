class Gallery < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged
	validates :title, presence: true
	has_many :gallery_attachments, dependent: :destroy
	accepts_nested_attributes_for :gallery_attachments

	def self.GalleryQuery
		select("galleries.*, count(gallery_attachments.id) as gallery_attachments_count").joins("left outer join gallery_attachments on gallery_id=galleries.id").group("galleries.id")
	end
end
