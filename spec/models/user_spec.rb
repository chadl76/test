require 'rails_helper'


RSpec.describe User, type: :model do 
	
	

	it "has valid factory" do 
		expect(FactoryBot.create(:user)).to be_valid
	end

	it "is invalid without first_name" do 
		expect(FactoryBot.build(:user, first_name: nil)).not_to be_valid
	end

	it "returns full name for user" do 
		user = FactoryBot.build(:user, first_name: "Foo", last_name: "Bar")
		expect(user.full_name).to eq("Foo Bar")
	end
end