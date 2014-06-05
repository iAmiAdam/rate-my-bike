class Rating < ActiveRecord::Base
	belongs_to :bike
	belongs_to :user
	validates :rating, presence: true, inclusion: { in: 1..10 }

	def rated?(user_id, bike_id)
		unless Rating.where(user_id: user_id, bike_id: bike_id, created_at: current()) then false else true
	end
end