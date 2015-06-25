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
			@phone = Phone.new 
		end 

		def create
			@phone = Phone.new
			if @phone.update(params[:phone].permit(:q1))
				binding.pry
				redirect_to "/officers/submissions"
			else
				render :new
			end 
		end 



	end #class
end #module 
