class Relationship < ActiveRecord::Base
	belongs_to :friend, class_name: "User"
end