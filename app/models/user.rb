class User < ActiveRecord::Base

	has_secure_password

	has_many :posts


	validates :email,
	presence: true,
	uniqueness: {case_sensitive: false}

	validates :name,
	presence: true

	validates_confirmation_of :password, on: :create
	validates_presence_of :password_confirmation


	def self.authenticate email,password
		User.find_by_email(email).try(:authenticate, password)
	end

end
