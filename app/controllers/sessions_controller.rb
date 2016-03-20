class SessionsController < ApplicationController
	before_action :disable_login, only: [:new, :create]

	def new
		
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "You have successfully logged in"
			redirect_to user_path(user)
		else
			flash.now[:danger] = "There was something wrong with your information"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

	private
		def disable_login
			if logged_in?
				redirect_to root_path
			end
		end
end