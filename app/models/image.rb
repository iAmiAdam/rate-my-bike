class Image < ActiveRecord::Base
	extend Dragonfly::model
	belongs_to :bike
	belongs_to :user
end