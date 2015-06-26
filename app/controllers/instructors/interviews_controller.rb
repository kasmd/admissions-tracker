module Instructors

	class InterviewsController < ApplicationController 

		def new
			@submission = Submission.find_by(id: params[:submission_id])
			if @submission.nil? || @submission.status != 'pending-in-person' 
				redirect_to "/#{current_user.type_path}/submissions" and return
			else 
				@interview = Interview.new(submission_id: params[:id])
			end 
		end

		def create
			submission = Submission.find(params[:submission_id])
			submission.interview = Interview.new(params[:interview].permit(:q1, :q2, :q3, :q4, :q5, :notes))
			submission.interview_change_status
			if submission.interview.save
				redirect_to "/instructors/submissions"
			else
				render :new
			end 
		end 

	end 

end 