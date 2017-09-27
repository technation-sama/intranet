class Gallery < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged
	validates :title, presence: true
	has_many :gallery_attachments, dependent: :destroy
	accepts_nested_attributes_for :gallery_attachments
	
	after_commit :flush_cache

	class << self
	  def all_cached
	    Rails.cache.fetch("galleries") { includes(:gallery_attachments) }
	  end
	end

	private

	def flush_cache
		Rails.cache.delete("galleries")
	end

end
