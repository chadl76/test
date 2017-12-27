require 'faker'
FactoryBot.define do 
	factory :user, class: 'User' do |f|
		f.first_name { Faker::Name.first_name }
		f.last_name { Faker::Name.last_name }
		f.email { Faker::Internet.email }
		f.password { Faker::Internet.password}
	end
end