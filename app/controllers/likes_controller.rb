class LikesController < ApplicationController
	before_action :authenticate_user!
  #before_action :set_post
  
    def create
  	@user = current_user
  	#@like = @user.likes.build(like_params)
    @like = Like.new(like_params)
    #@like.post_id = @post.id
  	#@like.user_id = current_user.id
  	if @like.save!
      flash[:notice] = "succefully liked"
  		redirect_to newsfeed_path(@user)
  	end
  end

  def update
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.update(status: true)
    if @friendship.save
      redirect_to newsfeed_path(current_user)
    end
  end


  private

  def like_params
  	params.require(:like).permit(:post_id)
  end

    def set_post
    @post = Post.find(params[:post_id])
  end
end
