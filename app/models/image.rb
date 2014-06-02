class Image < ActiveRecord::Base
	belongs_to :user
	belongs_to :bike

	private

		def random_name
			Digest::SHA1.hexdigest(Time.now.to_s)
		end
end