class Rating < ActiveRecord::Base
	belongs_to :bike
	belongs_to :user
	validates :score, presence: true, inclusion: { in: 1..10 }
end