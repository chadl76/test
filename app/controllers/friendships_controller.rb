class FriendshipsController < ApplicationController
	before_action :authenticate_user!

  def index 
  end

  def create
  	@friendship = current_user.friendships.build(friend_id: params[:friend_id])

  	if @friendship.save
  		flash[:notice] = "Friend requested"
  		redirect_to newsfeed_path(current_user)
  	else
  		flash[:error] = "Unable to request friend"
  		redirect_to :back
  	end
  end

  def update
  	@friendship = Friendship.find_by(params[:friend_id])
  	@friendship.update(friend_id: params[:friend_id])
    @friendship.update(accepted: true)
  	if @friendship.save
  		redirect_to newsfeed_path(current_user)
  	end
  end

  def destroy
  	@friendship = Friendship.find_by(id: params[:id])
  	@friendship.destroy
  	if @friendship.destroy
	    redirect_to newsfeed_path(current_user)
  	end
  end

  private

   def friendship_params
    params.require(:friendships).permit(
                :friend_id,
                :id)
   end
end
