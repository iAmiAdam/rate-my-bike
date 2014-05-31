require 'spec_helper'

describe Bike do
  before { @bike = Bike.new(make: "Cervelo", model: "S2", name: "Race Bike", description: "Only for Summer", category: 1, user_id: 1)  }

  subject { @bike }

  it { should respond_to(:make) }
  it { should respond_to(:model) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:category) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when make is" do
  	describe "not present" do
  		before { @bike.make = " " }
  		it { should_not be_valid }
  	end

  	describe "too short" do
  		 before { @bike.make = "a" }
  		it { should_not be_valid }
  	end

  	describe "too long" do
  		before { @bike.make = "a" * 21 }
  		it { should_not be_valid }
  	end
  end

  describe "when model is" do
  	describe "not present" do
  		before { @bike.model = " " }
  		it { should_not be_valid }
  	end

  	describe "too short" do
  		before { @bike.model = "a" }
  		it { should_not be_valid }
  	end

  	describe "too long" do
  		before { @bike.model = "a" * 21 }
  		it { should_not be_valid }
  	end
  end

  describe "when name is" do
  	describe "too short" do
  		before { @bike.name = "a" }
  		it { should_not be_valid }
  	end

  	describe "too long" do
  		before { @bike.name = "a" }
  		it { should_not be_valid }
  	end
  end

  describe "when description is" do
  	describe "not present" do
  		before { @bike.description = " " }
  		it { should_not be_valid }
  	end

  	describe "too short" do
  		before { @bike.description = "a" }
  		it {should_not be_valid}
  	end

  	describe "too long" do
  		before { @bike.description = "a" * 201}
  		it { should_not be_valid }
  	end
  end
end