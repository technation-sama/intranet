class Post < ApplicationRecord
	has_many :comments
	validates :title, :description, presence: true
end