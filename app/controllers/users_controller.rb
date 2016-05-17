class UsersController < ApplicationController
  before_action :authenticate_user!
  
	def index
		@users = User.all_except(current_user.friends && current_user)
	end

	def current
		@user = current_user
	end
end