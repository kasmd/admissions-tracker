module Students
	class SubmissionsController < ApplicationController
		def index
			@submissions = Submission.where(student_id: session[:user_id])
		end

		def show
			
		end

	end #class
end #module