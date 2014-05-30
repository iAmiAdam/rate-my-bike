require 'spec_helper'

describe User do
	
  before { @user = User.new(username: "Example", email: "user@example.com", password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
end
