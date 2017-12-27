class Photo < ApplicationRecord
	belongs_to :user
	has_many :likes, :as => :likeable, :dependent => :destroy

	has_attached_file :image
	
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
