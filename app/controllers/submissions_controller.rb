class SubmissionsController < ApplicationController
  before_action :authorize

  def new
  	@submission = Submission.new
  end

  def create
    @submission = Submission.new
    @submission.student.fname
  end

  private

  def submission_params
    params.require(:submission).permit(:subject, :start_date)
  end


end