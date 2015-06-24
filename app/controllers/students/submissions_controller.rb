module Students
	class SubmissionsController < ApplicationController
<<<<<<< HEAD
		
		

		def index
		end

	end
end
=======
		def index
			@submissions = Submission.where(student_id: session[:user_id])
		end

		def show
			
		end

	end #class
end #module
>>>>>>> 22abd2b8af72e561a47b05ca864e40a89696d5c3
