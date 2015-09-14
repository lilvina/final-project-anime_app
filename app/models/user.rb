class User < ActiveRecord::Base
	has_secure_password

  # CJ: don't think you're using this anymore, so I would remove
	has_many :polls, dependent: :destroy

	validates :email, :presence => true, uniqueness: true
	validates :password_digest, :presence => true, confirmation: true
end
