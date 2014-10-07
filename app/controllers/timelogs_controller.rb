class TimelogsController < ApplicationController
	before_action :authenticate_user!, :except => [:home]
	def create
		@timelog = Timelog.new(timelog_params)
		@timelog.user = current_user;
		@timelog.save!
		redirect_to :timelogs
	end

	private
	def timelog_params
		params.require(:timelog).permit(:time, :description, :timelog_type)
	end
end
