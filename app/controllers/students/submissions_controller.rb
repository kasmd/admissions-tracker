module Students
	class SubmissionsController < ApplicationController

		before_action :students_only

		def index
			@submissions = Submission.where(student_id: session[:user_id])
		end

		def show
			@submission = Submission.find(params[:id])
		end

	end #class
end #module

