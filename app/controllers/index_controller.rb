class IndexController < ApplicationController
	def index
		@@items = 10
		@waiting = Waiting.first
		@timer = Timetable.first
		@list_time = []
		@timer.time.split(",").each do |n|
			if @list_time.length < @@items-1
				@list_time << n
			end
		end
		@array_waiters = []
		Waiting.all[0..@@items].each do |n|
			@array_waiters << n
		end
	end
	def new
		@waiting = Waiting.find(params[:waiting])
	end
end
