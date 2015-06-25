module Instructors
	class SubmissionsController < ApplicationController

		before_action :instructors_only
		
		def index
			@submissions = Submission.all
		end

		def show
			@submission = Submission.find(params[:id])
			render :partial => '/shared/submissions_show'
		end

		def new
			@submission = Submission.find(params[:id])
			@interview = Interview.new(submission_id: params[:id])
		end

		def create
			submission = Submission.find(params[:id])
			submission.interview = Interview.new(params[:interview].permit(:q1, :q2, :q3, :q4, :q5, :notes))
			if submission.interview.save
				redirect_to "/instructors/submissions"
			else
				render :new
			end
		end

	end #class
end #module

