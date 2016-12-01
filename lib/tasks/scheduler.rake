desc "This task is called by the Heroku scheduler add-on"
task :update_timetable => :environment do
  puts "Updating feed..."
  Timetable.first.get_info
  Timetable.first.new_time
  puts "done."
end
