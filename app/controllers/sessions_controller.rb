 class SessionsController < ApplicationController

    def new
    end 

    def create
        user = User.find_by({email: params[:email]})

        if user && user.authenticate(params[:password])

            session[:user_id] = user.id

            session[:user_type] = user.type

            if session[:user_type] == 'Instructor' || session[:user_type] == 'Officer'
                redirect_to "/faculties/#{user.id}/students"
            elsif session[:user_type] == 'Student'
                redirect_to "/students/#{user.id}"
            else 
                redirect_to "/"
            end 

        end #if

    end #create

    def destroy
        session[:user_id] = nil
        redirect_to '/login'
    end 

end 