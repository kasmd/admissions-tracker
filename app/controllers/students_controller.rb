class StudentsController < ApplicationController

	before_action :authorize, except: [:create, :new]
	
	# Can this be deleted? Someone check it out :)

	# def show
	# 	@student = User.find session[:user_id]
	# 	@submissions = @student.submissions
	# end 

	# def index
	# 	@students = Student.all
	# end

	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			session[:user_id] = @student.id
			session[:user_type] = 'Student'
			redirect_path = session[:redirect] || '/'
			session[:redirect] = nil
			# UserMailer.welcome_user(current_user).deliver_now
			redirect_to redirect_path
		else
			render :new
		end
	end

  private

  def student_params
    params.require(:student).permit(:f_name, :l_name, :email, :phone_number, :password, :password_confirmation)
  end

end 