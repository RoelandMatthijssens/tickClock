class StaticPagesController < ApplicationController
	before_action :authenticate_user!, :except => [:home]
	def home
	end
  def log
		@logs = Timelog.all
		@timelog = Timelog.new
  end
end
