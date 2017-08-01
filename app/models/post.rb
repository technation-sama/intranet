class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, :description, presence: true
end
