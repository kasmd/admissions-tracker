class SubmissionsController < ApplicationController

  before_action :students_only

  def new
    @student = Student.find(session[:user_id])
    @submission = @student.submissions.new(course_id: params[:course_id]) unless session[:user_id].nil?
  end

  def create
    @submission = Student.find(session[:user_id]).submissions.new(course_id: params[:course_id])
  end

  private

  def submission_params
    params.require(:submission).permit(:user_id, :course_id)
  end


end