class SessionsController < ApplicationController

	def new
		@user = current_user
	end

	def startup

	end

	def create
		@user = User.authenticate(params[:user][:email], params[:user][:password])

		if @user
			session[:user_id] = @user.id
			flash[:success] = "You have just logged in"
			# User.create
			redirect_to root_path
		else
			flash[:error] = "Incorrect Login"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have successfully logged out"

		redirect_to login_path
	end
end