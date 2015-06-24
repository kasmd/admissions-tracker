module Officers
	class SubmissionsController < ApplicationController

		before_action :officers_only

		def index
			@submissions = Submission.all
		end

		def show
			@submission = Submission.find(params[:id])
		end

	end
end
