class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end 

  def instructors_only
    authorize
    if session[:user_type] != 'Instructor'
      render status: :forbidden
    end
  end

  def students_only
    authorize
    if session[:user_type] != 'Student'
      render status: :forbidden
    end
  end

  def officers_only
    authorize
    if session[:user_type] != 'Officer'
      render status: :forbidden
    end
  end

end
