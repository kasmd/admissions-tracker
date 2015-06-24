module Officers
	class SubmissionsController < ApplicationController

		before_action :officers_only

		def index
			@submissions = Submission.all
		end

		def show
			@submission = Submission.find(params[:id])
			# to display questions and answers
			@answer = Answer.find(params[:submission_id])
		end

	end
end
