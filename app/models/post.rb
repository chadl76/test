class Post < ApplicationRecord
	belongs_to :user, optional: true
	has_many :comments, dependent: :destroy
	has_many :likes, :as => :likeable, :dependent => :destroy
	has_many :likers, :through => :likes, :source => :user
end
