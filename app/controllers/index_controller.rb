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
		9.times do |n|
			@array_waiters << Waiting.find(id = (n+1))
		end
	end
	def new
		@waiting = Waiting.find(params[:waiting])
	end
end
