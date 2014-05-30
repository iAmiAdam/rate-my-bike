require 'spec_helper'

describe User do
	
  before { @user = User.new(username: "Example", email: "user@example.com", password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "when username" do

  	describe "is too short" do
  		before { @user.username = "aa" }
  		it { should_not be_valid}
  	end

  	describe "is too long" do
  		before { @user.username = "a" * 21 }
  		it { should_not be_valid }
  	end

  	describe "is not present" do
  		before { @user.username = " " }
  		it { should_not be_valid }
  	end

  	describe "is not valid" do

  		describe "because of illegal characters" do
  			usernames = %w[@Example ex.ample $Example 456Example]
  				usernames.each do |invalid_username|
  					before { @user.username = invalid_username } 
  					it { should_not be_valid }
  				end
  			end
  		end

  		describe "because it already exists" do
  			before do
  				user_with_same_username = @user.dup
  				user_with_same_username.username = @user.username.upcase
  				user_with_same_username.save
  			end
  			it { should_not be_valid }
  		end
   	end

  describe "when email" do

  	describe "is not present" do
  		before { @user.email = " " }
  		it { should_not be_valid }
  	end

  	describe "already exists" do
  		before do
  			user_with_same_email = @user.dup
  			user_with_same_email.email = @user.email.upcase
  			user_with_same_email.save
		end
		it { should_not be_valid }
	end

	describe "is not valid" do
		addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
  		addresses.each do |valid_address|
  			before { @user.email = valid_address }
  			it { should_not be_valid}
  		end
	end
  end
end