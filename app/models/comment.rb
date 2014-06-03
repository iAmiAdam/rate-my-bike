class Comment < ActiveRecord::Base
	# Comments belong to the user who made them, not the bike
	belongs_to :user
	# Validate content of the comment
	validates :content, length: { minimum: 10, maximum: 200}

	belongs_to :bike
end
