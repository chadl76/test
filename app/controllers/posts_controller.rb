class PostsController < ApplicationController
	before_action :authenticate_user!
	#before_action :set_post, only: [:show, :index]


	#def new
	#	@user = current_user
	#	@post = @user.posts.build
	#	@comment = Comment.new(post_id: params[:post_id])
	#send

	def show
		@user = current_user
		@post = Post.find(params[:id])	
		@like = Like.new
		redirect_to newsfeed_path(current_user)
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
		flash[:success] = "Post created"
		redirect_to newsfeed_path(current_user)
		end		

	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash[:warning] = "post deleted" 
		redirect_to newsfeed_path(current_user)
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
