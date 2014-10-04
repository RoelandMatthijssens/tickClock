class LogTimeController < ApplicationController
	def create
		@log = TimeLog.create(params)
	end
end
