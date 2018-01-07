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
  	@friendship = Friendship.find_by(id: params[:id])
  	@friendship.update(accepted: true)
  	if @friendship.save
      flash[:success] = "Friend accepted" 
  		redirect_to newsfeed_path(current_user)
  	end
  end

  def destroy
  	@friendship = Friendship.find_by(id: params[:id])
  	@friendship.destroy
  	if @friendship.destroy
      falsh[:warning] = "Friendship declined"
	    redirect_to newsfeed_path(current_user)
  	end
  end

  private

   def friendship_params
    params.require(:friendships).permit(
                :friend_id,
                :accepted,
                :id)
   end
end
