module Instructors
	class SubmissionsController < ApplicationController

		before_action :instructors_only
		
		def index
			@submissions = Submission.all
		end

		def show
			@submission = Submission.find(params[:id])
		end

	end #class
end #module

