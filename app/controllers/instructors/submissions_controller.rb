module Instructors
	class SubmissionsController < ApplicationController

		before_action :instructors_only
		
		def index
		end

	end
end