module Officers

	class PhonescreensController < ApplicationController 

		def new
			@submission = Submission.find_by(id: params[:submission_id])
			if @submission.nil? || @submission.status != 'pending-phone' 
				redirect_to "/#{current_user.type_path}/submissions" and return
			else 
				@phonescreen = Phonescreen.new(submission_id: params[:id])
			end 
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