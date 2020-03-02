# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  phone_number    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  validates :phone_number, :presence => true
  has_many :flights, :dependent => :destroy

  def upcoming_flights
    #start_date = 1.days.ago
    end_date = Date.today
    #self.flights.where({ :created_at => (start_date..end_date) })
    return self.flights.where("departs_at > ?", end_date)
  end

  def past_flights
    return self.flights.where("departs_at < ?", Date.today)
  end


end
