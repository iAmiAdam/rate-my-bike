class Rating < ActiveRecord::Base
	belongs_to :bike
	belongs_to :user
	validates :score, presence: true, inclusion: { in: 1..10 }
	scope :today, lambda { where("created_at >= ? and created_at <= ?", Date.today.beginning_of_day, Date.today.end_of_day) }
end