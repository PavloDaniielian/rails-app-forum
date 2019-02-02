class SessionsController < ApplicationController
	def new
	end

	def create
		#for :login method doc view => gems 'bcrypt'
		user = User.find_by(email: params[:login][:email].upcase)

		#check DB if user exists && if user password matches
		if user && user.authenticate(params[:login][:password])
			### SAVE ###
		    #save user.id in user's session cookie
		    session[:user_id] = user.id.to_s
		    redirect_to welcome_index_path, notice: 'Success - You have logged in!'
		else
			flash.now.alert = "Error - You have failed login!"
			render :new
		end		
	end

	# def has_active_session_cookie
	#  current_user = User.find_by_id(session[:user_id]) != nil
	# end

	def destroy
		### DELETE ###
		#delete user.id from user's session cookie
		session.delete(:user_id)
		redirect_to root_path, notice: 'You have logged out!'
	end	
end
