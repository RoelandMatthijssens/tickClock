class StaticPagesController < ApplicationController
	before_action :authenticate_user!, :except => [:home]
	def home
	end
  def timelogs
		@timelogs = Timelog.all
		@newtimelog = Timelog.new
  end
end
