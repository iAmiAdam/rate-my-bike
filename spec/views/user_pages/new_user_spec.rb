require 'spec_helper'

describe "register new user" do
	subject { page }

	before { visit signup_path }

	let(:submit) { "Create Account" }

	describe "with valid information" do
		before do
			fill_in "user_username", with: "Example"
			fill_in "user_email", with: "user@example.com"
			fill_in "user_password", with: "foobar"
			fill_in "user_password_confirmation", with: "foobar"
		end

		it "should create a user" do
			expect { click_button submit }.to change(User, :count).by(1)
		end
	end

	describe "with invalid information" do

		it "should not create a user" do
			expect { click_button submit }.not_to change(User, :count)
		end

		describe "after submission" do
			before { click_button submit }
			it { should have_title('Sign up' ) }
			it { should have_content('error') }
		end
	end
end