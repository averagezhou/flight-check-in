#rails dev:prime - populate with dummy data
namespace(:dev) do
  desc "Hydrate the database with some dummy data to look at so that developing is easier"
  task({ :prime => :environment}) do
    u = User.new
    u.email = "devprime@example.com"
    u.password = "password"
    u.phone_number = "1234567890"
    u.save

    f = Flight.new
    f.departs_at = 24.hours.from_now - 10.minutes
    f.user_id = u.id 
    f.description = "10 minutes before cutoff"
    f.save

    f = Flight.new
    f.departs_at = 24.hours.from_now + 10.minutes
    f.user_id = u.id 
    f.description = "10 minutes after cutoff"
    f.save

    p Flight.count
    p u.errors.full_messages
    p f.errors.full_messages
    p u
    p f 


  end
end
