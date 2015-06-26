module Officers
	class SubmissionsController < ApplicationController

		before_action :officers_only

		def index
			@submissions = Submission.all
		end

		def show
			@submission = Submission.find(params[:id])
			render :'/shared/submissions_show'
		end

		def create
			submission = Submission.find(params[:id])
			submission.phonescreen = Phonescreen.new(params[:phonescreen].permit(:q1, :q2, :q3, :q4, :q5, :notes))
			if submission.phonescreen.save
		redirect_to "/officers/submissions"

			else
				render :new
			end 
		end 


	end #class
end #module 
