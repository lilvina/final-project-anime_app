class UsersController < ApplicationController
 before_action :authorize, only: [:show, :index]

	def index
	end

	def new
		if current_user
			redirect_to '/'
		else
			@user = User.new
			render :new
		end
	end

	def create
		if current_user
			redirect_to '/'
		else
			user = User.new(user_params)
			if user.save
				session[:user_id] = user.id
				redirect_to '/'
			else
				flash[:error] = "Try again to save your account!"
				redirect_to signup_path
			end
		end
	end

	def show
	end

	def update
		if current_user
			form_params = params.require(:user).permit(:first_name, :last_name, :user_name, :email)
			current_user.update_attributes(form_params)
			redirect_to '/'
			flash[:success] = "Profile has been updated!"
		else
			redirect_to '/'
		end
	end

	private
		def user_params
			params.require(:user).permit(:email, :password)
		end

end