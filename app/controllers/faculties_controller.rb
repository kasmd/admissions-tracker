class FacultiesController < ApplicationController

	before_action :authorize, expect: [:create, :new]

	def index

	end

	def show
		@instructor = User.find(params[:id])
	end 

end 