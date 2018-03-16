class Mteam < ApplicationRecord
    validates :title, :question, presence: true
end
