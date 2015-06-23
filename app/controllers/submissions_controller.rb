class SubmissionsController < ApplicationController
  before_action :authorize

  def new
  	@submission = Submission.new
  end

  def create
    @submission = Student.find(session[:user_id]).submissions.new(course_id: params[:course_id])
  end

  private

  def submission_params
    params.require(:submission).permit(:subject, :start_date)
  end


end