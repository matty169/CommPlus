# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  date        :date
#  time        :time
#  location    :string(255)
#  description :string(255)
#  attendee_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
	has_many :users, :through => attendee
	has_many :skills, :through => attendee
end
