module Instructors

	class InterviewsController < ApplicationController 

		def create
			submission = Submission.find(params[:submission_id])
			submission.interview = Interview.new(params[:interview].permit(:q1, :q2, :q3, :q4, :q5, :notes))
			if submission.interview.save
				# submission.interview.change
				redirect_to "/instructors/submissions"
			else
				render :new
			end 
		end 

	end 

end 