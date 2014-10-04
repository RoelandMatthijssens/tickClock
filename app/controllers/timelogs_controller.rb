class TimelogsController < ApplicationController
	before_action :authenticate_user!, :except => [:home]
	def create
		@log = Timelog.new(timelog_params)
		@log.user = current_user;
		@log.save!
		redirect_to :log
	end

	private
	def timelog_params
		params.require(:timelog).permit(:time, :description, :log_type)
	end
end
