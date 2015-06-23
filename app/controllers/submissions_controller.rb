class SubmissionsController < ApplicationController

  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def new
  	@submission = Submission.new
  end

  def create

  end


end