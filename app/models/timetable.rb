class Timetable < ApplicationRecord
	include ActiveModel::Dirty
	def get_info
		@agent = Mechanize.new {|agent|
		agent.user_agent_alias = 'Mac Safari'
		}

		@time = Time.now
		@time_late = @time + (60*80) + 60*5

		@page_early = @agent.get("https://www.arlandaexpress.se/default.aspx?page=265&location=sto&when=depart&date=#{@time.strftime('%Y-%m-%d')}&hour=#{@time.strftime('%H')}&minute=#{@time.strftime('%M')}")
		@page_late = @agent.get("https://www.arlandaexpress.se/default.aspx?page=265&location=sto&when=depart&date=#{@time_late.strftime('%Y-%m-%d')}&hour=#{@time_late.strftime('%H')}&minute=#{@time_late.strftime('%M')}")

		@html_results_early = Nokogiri::HTML(@page_early.body)
		@html_results_late = Nokogiri::HTML(@page_late.body)
		@array_times = []

		@html_results_early.css('div.origin .time').each do |n|
			@array_times << n.text
		end
		@html_results_late.css('div.origin .time').each do |n|
			@array_times << n.text
		end
		#store old timetable in timeold to check wether it is updated.
		self.timeold = self.time
		
		#Store array as string

		self.time = @array_times.join(",")
		self.save!
	end
	def new_time
		if self.timeold != self.time
			Waiting.shift_waitings
		end
	end
end