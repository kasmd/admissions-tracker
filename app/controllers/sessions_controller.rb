class SessionsController < ApplicationController

	def new
	end 

	def create
		user = User.find_by({email: params[:email]})

		if user && user.authenticate(params[:password])

			session[:user_id] = user.id

			session[:user_type] = user.type

			redirect_path = session[:redirect] || "/#{user.type_path}/submissions"
			session[:redirect] = nil

			if session[:user_type]
				redirect_to redirect_path
			else
				redirect_to "/"
			end
		else
			redirect_to login_path, :flash => { :error => "Incorrect email or password!" }
		end #if

	end #create

	def destroy
		session.clear
		redirect_to '/'
	end 

end