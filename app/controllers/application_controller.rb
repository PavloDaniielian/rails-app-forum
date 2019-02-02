class ApplicationController < ActionController::Base

before_action :set_csrf_cookie

protect_from_forgery with: :exception
helper_method :current_user

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end


private

  def set_csrf_cookie
    cookies["CSRF-TOKEN"] = form_authenticity_token
  end
end
