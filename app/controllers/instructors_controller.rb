class InstructorsController < ApplicationsController

	before_action :authorize, expect: [:create, :new]

	def index
		@students = Student.all
	end

end 