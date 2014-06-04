class Relationship < ActiveRecord::Base
	belongs_to :friend, class_name: "User"
	validates :user_id, presence: true
end