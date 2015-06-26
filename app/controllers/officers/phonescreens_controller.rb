module Officers

	class PhonescreensController < ApplicationController 

		def new
			@submission = Submission.find(params[:submission_id])
			@phonescreen = Phonescreen.new(submission_id: params[:submission_id])
		end 

		def create
			submission = Submission.find(params[:submission_id])
			submission.phonescreen = Phonescreen.new(params[:phonescreen].permit(:q1, :q2, :q3, :q4, :q5, :notes))
			submission.phone_change_status
			if submission.phonescreen
				redirect_to "/officers/submissions"
			else
				render :new
			end 
		end 

	end 

end 