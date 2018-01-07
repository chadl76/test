class LikesController < ApplicationController
	before_action :authenticate_user!
  before_action :set_post
  
    def create
  	@user = current_user
  	@like = @post.likes.build(like_params)
    @like.user_id = current_user.id
    @like.likeable_id = @post.id
    #@like = (post_id: params[:post_id])
    #@like.post_id = @post.id
  	#@like.user_id = current_user.id
    #@like = @post.likes.create
    #qweqweq
    if @like.save!
      flash[:notice] = "succefully liked"
  		redirect_to newsfeed_path(@user)
    end
  end

  def update
    #@friendship = Friendship.find_by(id: params[:id])
    #@friendship.update(status: true)
    #if @friendship.save
    #  redirect_to newsfeed_path(current_user)
    #end
  end


  private

  def like_params
  	params.permit(:post_id)
  end

    def set_post
    @post = Post.find(params[:post_id])
  end
end
