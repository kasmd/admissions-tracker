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
    if current_user.has_already_submitted?(params[:course_id])
      redirect_to students_submission_path(current_user.submission_for(params[:course_id]))
    else
      @submission = current_user.submissions.new(course_id: params[:course_id])
      @submission.save_attachment(params[:submission][:upload])
      if @submission.save
        # this is broken on heroku
        # UserMailer.welcome_email(current_user,@submission.course).deliver_now
        redirect_to '/students/submissions'
      else
        render :new
      end
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:user_id, :course_id)
  end


end