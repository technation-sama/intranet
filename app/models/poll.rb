class Poll < ApplicationRecord
  belongs_to :user
  validates :user_id, :body, :project_name, presence: true
end
