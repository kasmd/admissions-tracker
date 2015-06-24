module Instructors
	class SubmissionsController < ApplicationController
		def index
			@submissions = Submission.all
		end

		def show
			@submission = Submission.find(params[:id])
		end

	end #class
end #module