require 'rails_helper'

describe "UserSignin" do 
	let(:user) { FactoryBot.create(:user) }

	it "should allow a registered user to sign in" do 
		visit new_user_session_path
		fill_in "Email", :with => user.email, :match => :prefer_exact
		fill_in "Password", :with => user.password
		
		click_button "Sign in "
		expect(page).to have_current_path(newsfeed_path(:user))
	end
end