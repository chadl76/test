class Friendship < ApplicationRecord
	belongs_to :user
	belongs_to :friend, class_name: "User"
	

	def accept
		current_user.friends << friend
	end
end
