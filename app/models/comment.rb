class Comment < ApplicationRecord
  acts_as_votable
  belongs_to :post
end
