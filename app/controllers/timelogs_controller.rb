class TimelogsController < ApplicationController
	before_action :authenticate_user!, :except => [:home]

	def index
		@timelogs = Timelog.all
		@newtimelog = Timelog.new
	end

	def create
		@timelog = Timelog.new(timelog_params)
		@timelog.user = current_user;
		@timelog.save!
		flash[:notice] = [timelog_params.inspect]
		redirect_to :timelogs
	end

	private
	def timelog_params
		params.require(:timelog).permit(:time, :description, :kind)
	end
end
