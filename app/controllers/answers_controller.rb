class AnswersController < ApplicationController
	def new
		@survey = Survey.find(params[:id])
		
	end


	def create
		answers = Answer.new
		answers.submission_id = params[:id]


		# redirect to officers/submissions/
	end
end