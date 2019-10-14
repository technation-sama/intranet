class MaintainaceReport < ApplicationRecord
  validates :user_id, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :email, presence: true
  

end
