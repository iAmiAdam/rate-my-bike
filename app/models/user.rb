class User < ActiveRecord::Base
	# Users have many bikes which will be destroyed if the user is deleted
	has_many :bikes, dependent: :destroy
	# Users have many comments which will be destroyed is the user is deleted
	has_many :comments, dependent: :destroy
	# Users have many friends with the correct database key, obviously dependent on the user
	has_many :friends, foreign_key: "friend_id", dependent: :destroy
	# Make the user's email lower case to save any headaches when searching
	before_save { self.email = email.downcase }
	# Create a token to remember the session on the first sign in
	# before_create :create_remember_token

	# Validate username
	VALID_USERNAME_REGEX= /\A[a-z][a-z0-9_\.]/i
	validates :username, presence: true, format: {with: VALID_USERNAME_REGEX}, length: { minimum: 3, maximum: 20 }, uniqueness: {case_sensitive: false}

	# Validate email
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+[a-z]\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	# Validate password
	validates :password, length: { minimum: 6 }

	# Scope to search for database items without case getting in the way
	scope :ci_find, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }

	# Invoke bcrypt
	has_secure_password

	# The method for creating a token
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	# Method for encrypting user info
	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

		# Creating tokens so that User's are remembered
		def create_remember_token
			self.remember_token = User.digest(User.new_remember_token)
		end
end
