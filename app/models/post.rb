class Post < ApplicationRecord
	acts_as_votable
	has_many :comments, dependent: :destroy
	validates :title, :description, presence: true
end
