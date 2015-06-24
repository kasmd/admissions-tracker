class SessionsController < ApplicationController

	def new
		@redirect_path = params[:redirect_path]
	end 

	def create
		user = User.find_by({email: params[:email]})
		@redirect_path = params[:redirect_path] || request.path_info

		if user && user.authenticate(params[:password])

			session[:user_id] = user.id

			session[:user_type] = user.type

			if session[:user_type]
				redirect_to "/#{user.type.downcase}s/submissions"
			else 
				redirect_to "/"
			end
		else
			redirect_to login_path, :flash => { :error => "Incorrect email or password!" }
		end #if

	end #create

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end 

end