include ApplicationHelper

def sign_in(user, options={})
  # Sign in when not using Capybara as well.
  if options[:no_capybara]
  	remember_token = User.new_remember_token
  	cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
  else
  	visit(root_path)
  	fill_in "session_username",    with: user.username
  	fill_in "session_password", with: user.password
  	click_button "Sign in"
  end

end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end