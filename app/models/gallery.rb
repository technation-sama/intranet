class Gallery < ApplicationRecord
	validates :title, presence: true
	has_many :gallery_attachments, dependent: :destroy
end
