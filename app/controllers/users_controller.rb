class UsersController < ApplicationController
before_action :authenticate_user!

	def index
		@users = User.all
	end

	def newsfeed
		@post_new = current_user.posts.build
		@posts = current_user.posts
		@feed_items = current_user.feed

	end

	private


end
