class Gallery < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged
	validates :title, presence: true
	has_many :gallery_attachments, dependent: :destroy
	accepts_nested_attributes_for :gallery_attachments
	
	after_commit :flush_cache

	def self.cached_index(page_param)
		Rails.cache.fetch([name, "index"]) { includes(:gallery_attachments).page(page_param).per(20) }
	end

	def cached_gallery_attachments_count
		Rails.cache.fetch([self, "gallery_attachments_count"]) { gallery_attachments.size }
	end

	def cached_gallery_background
		Rails.cache.fetch([self, "gallery_background"]) { gallery_attachments.first.photo.url }
	end

	def flush_cache
		Rails.cache.delete([self.class.name, "galleryloading"])
	end
end
