class WelcomesController < ApplicationController

	def index
		@randoms = RandomuserLocal.generate(3)
	end 

end 