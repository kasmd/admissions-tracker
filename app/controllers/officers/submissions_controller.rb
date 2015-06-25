module Officers
	class SubmissionsController < ApplicationController

		before_action :officers_only

		def index
			@submissions = Submission.all
		end

		def show
			@submission = Submission.find(params[:id])
		end

		def new
			@submission = Submission.find(params[:id])
			@phonescreen = Phonescreen.new(submission_id: params[:id])
		end 

		def create
			submission = Submission.find(params[:id])
			submission.phonescreen = Phonescreen.new(params[:phonescreen].permit(:q1))
			if submission.phonescreen.save
				redirect_to "/officers/submissions"

			else
				render :new
			end 
		end 



	end #class
end #module 
