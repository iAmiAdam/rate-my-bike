require 'spec_helper'

describe "add new bike" do
	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

	before { visit new_bike_path }

	let(:submit) { "Add Bike" }

	describe "with valid information" do
		before do
			fill_in "bike_make", with: "Cervelo"
			fill_in "bike_model", with: "S2"
			fill_in "bike_name", with: "Race Bike"
			fill_in "bike_description", with: "Doesn't see daylight in winter."
			select "Road", from: "bike_category"
		end

		it "should create a bike" do
			expect { click_button submit}.to change(Bike, :count).by(1)
		end
	end
end