class UserMailer < ApplicationMailer
	default :from => 'admin@admitron.com'

  def welcome_email(user,course)
    @user = user
    @course = course
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Welcome to '+ @course.subject)
  end

  def welcome_user(user)
  	@user = user
  	@url  = 'http://localhost:3000/'
  	mail(to: @user.email, subject: 'Welcome to AdmiTron5000!')
  end
end