module Officers
	class SubmissionsController < ApplicationController

		before_action :officers_only

		def index
			@submissions = Submission.all
		end

		def show
			@submission = Submission.find(params[:id])
		end

		def edit
			@surveys = Survey.find(params[:id])
		end 

		def update
			@surveys = Survey.find(params[:id])
			#@surveys.whatever = params[:whatever]
			if @surveys.save 
				redirect_to "#"
			else 
				render :edit
			end 
		end 


	end
end
