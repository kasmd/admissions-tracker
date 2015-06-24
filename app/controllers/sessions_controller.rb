class SessionsController < ApplicationController

	def new
		@referer = URI(request.referer).path
		# referer url - store in hidden input
	end 

	def create
		user = User.find_by({email: params[:email]})

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