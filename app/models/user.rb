class User < ApplicationRecord
  acts_as_voter
  validates :hd, presence: { message: "Only samasorce eployees with a valid samasource email are authorized to login to this site. If you're an employee and not able to login please contact admin" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
	#relationship between user and posts & comments
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.image = auth.info.image
      user.oauth_refresh_token = auth.credentials.refresh_token if auth.credentials.refresh_token
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.hd = auth.extra.id_info.hd
      user.gender = auth.extra.raw_info.gender
      user.profile = auth.extra.raw_info.profile
        # user.skip_confirmation!
      #user.skip_verify_authenticity_token
    end
  end 
end
