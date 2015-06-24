class SubmissionsController < ApplicationController

  before_action :students_only

  def new
    @submission = Submission.new
    binding.pry
  end

  def create
    @submissions = Submission.where(student_id: session[:user_id])
    @submission = Student.find(session[:user_id]).submissions.new(course_id: params[:course_id])
    binding.pry
  end

  private

  def submission_params
    params.require(:submission).permit(:user_id, :course_id)
  end


end