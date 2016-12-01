desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  Timetable.first.get_info
  puts "done."
end

task :send_reminders => :environment do
  User.send_reminders
end