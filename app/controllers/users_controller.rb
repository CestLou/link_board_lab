class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Congratulations! You've signed up. Please login with your new credentials."
			redirect_to login_path
		else
			render :new
		end
	end

 private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end