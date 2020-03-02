task({ :send_sms => :environment }) do
  unsent = Flight.where({ :alert_sent => false })
  reminder = unsent.where("departs_at < ?", 24.hours.from_now)

  reminder.each do |flight|
    p flight.description
    p flight.departs_at
    p flight.alert_sent
  

    # Use the Twilio API code from Day 5
    # send alert to the user's phone number

    p flight.user.phone_number
    flight.alert_sent = true
    flight.save
  end



end