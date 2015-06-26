class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # FUN TIP: current_user is what's up

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # FUN TIP: you can access this helper method in a view

  helper_method :current_user

  def authorized?
    if current_user 
      true
    else
      session[:redirect] = request.path_info
      false
    end
  end

  def redirect_login
      redirect_to("/login") and return
  end

  def instructors_only
    if !authorized?
      redirect_login
    elsif session[:user_type] != 'Instructor'
      redirect_to '/' and return
    end
  end

  def students_only
    if !authorized?
      redirect_login
    elsif session[:user_type] != 'Student'
      redirect_to '/' and return
    end
  end

  def officers_only
    if !authorized?
      redirect_login
    elsif session[:user_type] != 'Officer'
      redirect_to '/' and return
    end
  end

end
