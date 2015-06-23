class InstructorsController < ApplicationController

	before_action :authorize, expect: [:create, :new]

	def index
		@students = Student.all
	end

end 