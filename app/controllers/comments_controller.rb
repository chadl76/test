class CommentsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user!
	#before_action :set_post


	def new
		@post = Post.find(params[:post_id])
		comment = Comment.new
	end



	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		if @comment.save!
			flash[:success] = "comment created"
			redirect_to newsfeed_path(current_user)
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body,
										:post_id,
										:author_id)
	end

	def set_post
		@post = Post.find(params[:post_id])
	end
end




	