class Bike < ActiveRecord::Base
	# All bikes have owners
	belongs_to :user
	# And all bikes have many ratings
	has_many :ratings, dependent: :destroy
	# All bikes have images too
	has_many :images, dependent: :destroy
	# Validate make
	validates :make, presence: true, length: { minimum: 3, maximum: 20 }
	# Validate model
	validates :model, presence: true, length: { minimum: 2, maximum: 20 }
	# Validate name
	validates :name, length: { minimum: 3, maximum: 20 }
	# Validate description
	validates :description, presence: true, length: { minimum: 15, maximum: 200}

end