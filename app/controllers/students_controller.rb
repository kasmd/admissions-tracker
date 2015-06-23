class StudentsController < ApplicationController

	before_action :authorize, expect: [:create, :new]
	
	def show
		@student = User.find session[:user_id]
		@submission = Submission.find session[:user_id]
	end 

end 