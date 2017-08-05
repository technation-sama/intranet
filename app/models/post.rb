class Post < ApplicationRecord
	acts_as_votable
        acts_as_taggable
	has_many :comments, dependent: :destroy
	validates :title, :description, presence: true
end
