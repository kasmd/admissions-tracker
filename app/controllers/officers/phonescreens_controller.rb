module Officers

	class PhonescreensController < ApplicationController 

		def create
			submission = Submission.find(params[:submission_id])
			submission.phonescreen = Phonescreen.new(params[:phonescreen].permit(:q1, :q2, :q3, :q4, :q5, :notes))
			if submission.phonescreen.save
				redirect_to "/officers/submissions"
			else
				render :new
			end 
		end 

	end 

end 