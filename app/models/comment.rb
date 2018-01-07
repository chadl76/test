class Comment < ApplicationRecord
	belongs_to :post, optional: true
	belongs_to :author, class_name: 'User'

	#validates_uniqueness_of :post_id, optional: true
end
