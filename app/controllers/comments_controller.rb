class CommentsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user!
	before_action :set_post


	def new
		@user = current_user
		@comment = @post.comments.build
		@comment.author_id = @user.id
		
		
	end



	def create
		
	
		#@comment = current_user.posts.comments.create(comment_params)
		@comment = @post.comments.build(comment_params)
		#@comment.post_id = @post.id
		@post = Post.find(params[:post_id])
		#@comment.author_id = current_user.id
		@comment.author_id = current_user.id
		@comment.post_id = @post.id
		
		@comment.save
		if @comment.save!
			redirect_to new_post_comment_path(@post)
		#redirect_to newsfeed_path(current_user)
	end
	end

	private

	def comment_params
		params.require(:comment).permit(
								:id, 
								:author_id,
								:post_id,
								:body)
	
	end

	def set_post
		@post = Post.find(params[:post_id])
	end
end




	