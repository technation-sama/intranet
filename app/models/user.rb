class User < ApplicationRecord
	acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	#relationship between user and posts & comments
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
end
