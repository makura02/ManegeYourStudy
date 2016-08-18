require 'date'
require 'sqlite3'
# declararion of e
e = ''

#today's datetime
today = DateTime.now.to_s.slice(0..9)
puts today

#study time in minutes
study_time = ARGV[0]

#DB connection
begin
  db = SQLite3::Database.open "mys.sqlite3"
  db.execute "INSERT INTO mys VALUES (null, '#{today}', #{study_time})"

rescue SQLite3::Exception => e

  puts "exception occured"
  puts e

ensure
  db.close if db
end
