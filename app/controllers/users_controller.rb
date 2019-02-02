class UsersController < ApplicationController
	def new
		@user= User.new
	end

	def create
		@user = User.new(user_params)
		@user.email.upcase!

		if @user.save
			flash[:notice] = "Success - User account has been created! You Must Login to Use App!"
			redirect_to '/login'
		else
			flash.now.alert = 'Error - User account not created!'
			render :new
		end
	end


	private
	def user_params
	#permit/allow access to fields , submitted by form to the require(:user) model
	 params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end
end
