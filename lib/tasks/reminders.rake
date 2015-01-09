desc "send reminder emails to unenrolled users"
task :reg_reminder => :environment do
  puts "Sending reminders to unenrolled users..."
  int = RemindRegistrationDropoffs.call
  puts "done. Sent #{int.users.length} emails."
end
