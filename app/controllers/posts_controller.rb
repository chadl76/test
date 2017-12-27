class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post, only: [:show, :index]

	#def new
	#	@user = current_user
	#	@post = @user.posts.build
	#	@comment = Comment.new(post_id: params[:post_id])
	#send

	def show
		@user = current_user
		@post = Post.find(params[:id])
		#@comment = Comment.new(:post => @post)
		#@comment.author_id = current_user.id
		#@comment.save
		#@comments = Comment.find_by(params[:post_id])
		redirect_to newsfeed_path(current_user)
	end

	def create
		@post = current_user.posts.build(post_params)
		
		
		if @post.save
		redirect_to newsfeed_path(current_user)
		end		

	end

	private
	
	def set_post
		@post = Post.find_by!(params[:id])
	end
	def post_params
		params.require(:post).permit(
								:id, 
								:user_id,
								:post_id,
								:title, 
								:body)
	end

end
