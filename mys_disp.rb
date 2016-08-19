require 'date'
require 'sqlite3'

#definition e
e = ''

# get current time
today = DateTime.now.to_s.slice(0..9)

begin

  db = SQLite3::Database.open "mys.sqlite3"
  stm = db.prepare "SELECT * FROM mys WHERE datetime <= '#{today}' ORDER BY datetime LIMIT 7"
  rs = stm.execute

  rs.each do |row|
    print row[1].slice(5..9)
    print " : "
    # display * every 20 munitues
    disptime = row[2] / 20
    disptime.times do 
      print "*"
    end
    puts ""
  end

rescue SQLite3::Exception => e
  puts "Exception occured"
  puts e

ensure
  stm.close if stm
  db.close if db
end

