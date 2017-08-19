class Comment < ApplicationRecord
  validates :body, presence: true
  acts_as_votable
  belongs_to :post
  belongs_to :user
  default_scope { order(created_at: :desc) }
  validates :body, presence: true
end
