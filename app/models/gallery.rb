class Gallery < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged
	validates :title, presence: true
	has_many :gallery_attachments, dependent: :destroy
	accepts_nested_attributes_for :gallery_attachments
	
	default_scope { order('created_at DESC') }
	
	scope :empty, ->{ 
		joins(:gallery_attachments).group('galleries.id').having('count(gallery_id) < 0')
	}
end
