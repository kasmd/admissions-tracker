module Instructors

	class InterviewsController < ApplicationController 

		def new
			@submission = Submission.find(params[:submission_id])
			@interview = Interview.new(submission_id: params[:id])
		end

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