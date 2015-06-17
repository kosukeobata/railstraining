class SessionsController < ApplicationController

	 # omniauthのログイン
	def create
		user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
		session[:user_id] = user.id
		redirect_to root_path, notice: 'ログインしました'
	end

	# omniauthのログアウト
	def destroy
		reset_session
		redirect_to root_path, notice: 'ログアウトしました'
	end

end
