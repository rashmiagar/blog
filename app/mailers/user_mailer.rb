class UserMailer < ApplicationMailer

	def share_post(friends, post)
		@friend = friends.first
		@post = post
		emails = friends.collect(&:email).join(',')
		mail(to: emails, subject: 'Shared post')
	end
end
