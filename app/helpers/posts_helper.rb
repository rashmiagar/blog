module PostsHelper

	def author (post)
		User.find(post.user_id).email
	end
end
