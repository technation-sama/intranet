class MaintainaceReport < ApplicationRecord
  validates :user_id, presence: true
  validates :location, presence: true
  validates :category, presence: true
  validates :description, presence: true

end
