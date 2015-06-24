module Officers
	class SubmissionsController < ApplicationController

		before_action :officers_only

		def index
		end

	end
end
