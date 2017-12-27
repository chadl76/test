require 'rails_helper'

FactoryBot. define do 
	factory :user do |f|
		f.first_name { Faker::Name.first_name }
		f.email { Faker::Internet.email }
		f.password { Faker::Internet.password }
	end
end

RSpec.describe UsersController, type: :controller do
	describe "UsersController" do 
		it "populates an array of users" do
			user = FactoryBot.create(:user)
			get :index 
			assigns(:user).should eq([user])
		end

		it "renders the :index view"
	end

end
