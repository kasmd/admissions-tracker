class StudentsController < ApplicationController

	before_action :authorize, except: [:create, :new]
	
	def show
		@student = User.find session[:user_id]
		@submissions = @student.submissions

	end 

	def index
		@students = Student.all
	end 
end 