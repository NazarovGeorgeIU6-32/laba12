class SessionsController < ApplicationController
	before_action :check_sign_in, only: [:new, :create]
	def new
	end
	
	def create
		user = User.authenticate params[:session][:email], params[:session][:password]
		if user.nil?
			redirect_to root_path, notice: 'invalid_login_password'
		else
			sign_in user
			redirect_to users_path
		end
	end
	
	def destroy
		sign_out
		redirect_to root_path
	end
	
	private
	def sign_in(user)
		session[:current_user_id] = user.id
	end

	def sign_out
		session[:current_user_id] = nil
	end
	
	def sign_in?
		!session[:current_user_id].blank?
	end
	
	def check_sign_in
		if sign_in?
			redirect_to users_path, notice: 'you have already login'
		end
	end
end
