module Instructors
	class SubmissionsController < ApplicationController

		before_action :instructors_only
		
		def index
			@submissions = Submission.all
		end

		def show
			@submission = Submission.find(params[:id])
			render :'/shared/submissions_show'
		end

		def create
			submission = Submission.find(params[:id])
			submission.interview = Interview.new(interview_params)
			if submission.interview.save
				redirect_to "/instructors/submissions"
			else
				render :new
			end
		end

		private

		def interview_params
			params.require(:interview).permit(:q1, :q2, :q3, :q4, :q5, :notes)
		end

	end #class
end #module

