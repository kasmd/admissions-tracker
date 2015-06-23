class SessionsController < ApplicationController

	def new
	end 

	def create
		user = User.find_by({email: params[:email]})

		if user && user.authenticate(params[:password])

			session[:user_id] = user.id

			if session[:type] == 'Instructor'
				redirect_to "/instructors/"
		elsif session[:type] == 'Student'
			redirect_to "/students/#{user.id}"
		end 
	end 

	end 

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end 

end 