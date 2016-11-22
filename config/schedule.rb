env :PATH, ENV['PATH']

every 2.minutes do
	runner "Timetable.first.get_info", :environment => 'development'
	runner "Timetable.first.new_time", :environment => 'development'

end