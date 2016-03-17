class User < ActiveRecord::Base
	has_many :articles
	has_secure_password
	before_save { self.email = email.downcase }
	validates :username,
						presence: true,
						uniqueness: { case_sensitive: false },
						length: { minimum: 3, maximum: 25 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,
						presence: true,
						uniqueness: { case_sensitive: false },
						length: { minimum: 15, maximum: 105 },
						format: { with: VALID_EMAIL_REGEX }
end