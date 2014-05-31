module SessionsHelper

	def sign_in(user)
		# Create new remember token
		remember_token = User.new_remember_token
		# Create cookie using that token
		cookies.permanent[:remember_token] = remember_token
		# Store token in the database
		user.update_attribute(:remember_token, User.digest(remember_token))
		# Assign current user to user variable.
		self.current_user = user
	end

	def signed_in?
		# If user is not nil then user is signed in
		!current_user.nil?
	end

	def current_user
		remember_token = User.digest(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def current_user=(user)
		# Assigns the current user local variable to the user
		@current_user = user
	end

	def current_user?(user)
		# Returns true if the current_user is assigned to the user it is passed
		user == current_user
	end

	def signed_in_user
		unless signed_in?
			# If a user is not signed in, it stores where the user was trying to reach and asks the user to sign in
			store_location
			redirect_to signin_url, notice: "Please Sign in."
		end
	end

	def sign_out
		# Reset remember token to prevent cookie hijacking
		current_user.update_attribute(:remember_token, User.digest(remember_token))
		cookies.delete(:remember_token)
		# Reset current_user to nothing
		self.current_user = nil
	end

	def redirect_back_or(default)
		# Redirect the user to the stored location
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url if request.get?
	end

end
