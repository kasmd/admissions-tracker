class FacultiesController < ApplicationController

	before_action :authorize
	before_action # instrucotors only

	def index

	end

	def show
		@instructor = User.find(params[:id])
	end 

end 