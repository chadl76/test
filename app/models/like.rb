class Like < ApplicationRecord
	belongs_to :user
	belongs_to :likeable, :polymorphic => true

	validates :post, uniqueness: {scope: :user}
end
