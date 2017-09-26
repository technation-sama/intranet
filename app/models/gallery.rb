class Gallery < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged
	validates :title, presence: true
	has_many :gallery_attachments, dependent: :destroy
	accepts_nested_attributes_for :gallery_attachments
end
