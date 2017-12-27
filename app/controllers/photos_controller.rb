class PhotosController < ApplicationController
	before_action :authenticate_user!

	def new
		@user = current_user
		@photo = Photo.new
	end

	def index
		@user = current_user
		@photos = Photo.all
	end

	def create
		@user = current_user
		@photo = @user.photos.create(photo_params)
		
		@photo.save!
		redirect_to newsfeed_path(current_user)
	end

	def show
		
	end

	private

	def photo_params
		params.require(:photo).permit(:user_id,
								:image, 
							:title)
	end
	
end
