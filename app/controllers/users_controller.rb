class UsersController < ApplicationController
	def index
		@users = User.all.except(:current_user)
	end

	def current
		@user = current_user

	end
	def share
		@friends = current_user.friends
		
	end

end