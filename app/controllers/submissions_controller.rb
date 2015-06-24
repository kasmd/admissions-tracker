class SubmissionsController < ApplicationController

  before_action :students_only

  def new
    current_user
    @submission = current_user.submissions.new(course_id: params[:course_id]) unless session[:user_id].nil?
  end

  def create
    @submission = current_user.submissions.new(course_id: params[:course_id])
    uploaded_file = params[:submission][:upload]
    user_name = current_user.f_name + current_user.l_name
    application_file_name = Rails.root.join('public', 'uploads', 'applications', ("course_#{params[:course_id]}"user_name + '.txt'))
    @submission.application_file_name = application_file_name
    File.open(application_file_name, 'wt') do |file|
      file.write(uploaded_file.read)
    end
    if @submission.save
      redirect_to '/students/submissions'
    else
      render :new
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:user_id, :course_id)
  end


end