# == Schema Information
#
# Table name: flights
#
#  id          :integer          not null, primary key
#  alert_sent  :boolean          default(FALSE)
#  departs_at  :datetime
#  description :string
#  locator     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Flight < ApplicationRecord
  validates :user_id, :presence => true
  validates :departs_at, :presence => true
end
