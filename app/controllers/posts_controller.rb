class PostsController < ApplicationController

	before_action :is_authenticated, except: :show

	def create
		@user = current_user
		@post = @user.posts.new(post_params)
		if @post.save
			redirect_to posts_path
			flash[:success] = "Post Added!!"
		else
			flash[:danger] = "Post not saved. Please try again!"
			render :new
		end
	end

	def show
		@post = Post.all
	end

	def update

	end

	def destroy
		redirect_to login_path
	end

	def new

	end

 private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end