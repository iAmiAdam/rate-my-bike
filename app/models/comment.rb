class Comment < ActiveRecord::Base
	# Comments belong to the user who made them
	belongs_to :user
	# Validate content of the comment
	validates :content, length: { minimum: 10, maximum: 200}
	# Comments also belong to a bike
	belongs_to :bike
end
