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
	has_many :attendees
	has_many :users, :through => :attendee
	has_many :attendees
	has_many :skills, :through => :attendee
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/Communityplus_:style.png"

end
