class Post < ApplicationRecord
	acts_as_votable
    acts_as_taggable
    belongs_to :user
	has_many :comments, dependent: :destroy
	validates :title, :description, presence: true
	default_scope { order('created_at DESC') }
end
