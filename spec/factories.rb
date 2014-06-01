FactoryGirl.define do 
	factory :user do
		sequence(:username) { |n| "User#{n}" }
		sequence(:email) { |n| "person#{n}@example.com" }
		password "foobar"
		password_confirmation "foobar"

		factory :admin do
			admin true
		end
	end
end