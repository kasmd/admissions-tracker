module Students
	class SubmissionsController < ApplicationController

		before_action :students_only

		def index
			@submissions = Submission.where(student_id: session[:user_id])
		end

		def show
			
		end

	end #class
end #module

