class UsersController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome #{@user.username} to the Alpha blog"
			redirect_to articles_path
		else
			render "new"
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:success] = "Your account was updated successfully"
			redirect_to articles_path
		else
			render "edit"
		end
	end

	def show
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end

		def set_article
			@user = User.find(params[:id])
		end
end