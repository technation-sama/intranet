class Comment < ApplicationRecord
  acts_as_votable
  belongs_to :post
  default_scope { order(created_at: :desc) }
  validates :body, presence: true
end
