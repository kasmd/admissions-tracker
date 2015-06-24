class UsersController < ApplicationController

	before_action :authorize, except: [:create, :new]
	
	def show
		@student = User.find session[:user_id]
		@submissions = @student.submissions

	end 

	def index
		@students = Student.all
	end

	def new
		@referer = URI(request.referer).path
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			redirect_to ('/login')
		else
			render :new
		end
	end

  private

  def student_params
    params.require(:student).permit(:f_name, :l_name, :email, :phone_number, :password)
  end

end 