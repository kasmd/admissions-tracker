class SubmissionsController < ApplicationController

  # To future Max: Clean this up -past Max

  before_action :students_only

  def new
    # checks if the current user has already submitted for this course
    if current_user.has_already_submitted?(params[:course_id])
      # else redirects to their submission for that course
      redirect_to students_submission_path(current_user.submission_for(params[:course_id]))
      # look at those beautiful semantically named methods
    else
      @submission = current_user.submissions.new(course_id: params[:course_id])
    end
  end

  def create
    @submission = current_user.submissions.new(course_id: params[:course_id])
    uploaded_file = params[:submission][:upload]
    user_name = current_user.f_name + current_user.l_name
    application_file_name = Rails.root.join('public', 'uploads', 'applications', ("course_#{params[:course_id]}_" + user_name + '.txt'))
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