class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def student?
    session[:user_type] == 'Student'
  end

  def instructor?
    session[:user_type] == 'Instructor'
  end

  def officer?
    session[:user_type] == 'Officer'
  end

  def authorize
    @redirect_path = request.path_info
    unless current_user
      redirect_to("/login?redirect_path=#{@redirect_path}") and return
    end
  end

  def instructors_only
    if authorize && session[:user_type] != 'Instructor'
      render status: :forbidden
    end
  end

  def students_only
    if authorize && session[:user_type] != 'Student'
      render status: :forbidden
    end
  end

  def officers_only
    if authorize && session[:user_type] != 'Officer'
      render status: :forbidden
    end
  end

end
