class Bike < ActiveRecord::Base
	# All bikes have owners
	belongs_to :user
	# And all bikes have many ratings
	has_many :ratings, dependent: :destroy
	# All bikes have images too
	dragonfly_accessor :picture
	# Validate make
	validates :make, presence: true, length: { minimum: 3, maximum: 20 }
	# Validate model
	validates :model, presence: true, length: { minimum: 2, maximum: 20 }
	# Validate name
	validates :name, length: { minimum: 3, maximum: 20 }
	# Validate description
	validates :description, presence: true, length: { minimum: 15, maximum: 200}


	has_many :comments

	def current_rating()
		score = 0 
		
		Bike.ratings.each do |f|
		score += Bike.ratings.score
		end
		score = score / Bike.ratings.count
	end
end