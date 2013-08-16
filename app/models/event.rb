# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)      default(""), not null
#  date        :date             default(Wed, 14 Aug 2013), not null
#  time        :time             default(2000-01-01 06:09:35 UTC), not null
#  location    :string(255)      default(""), not null
#  description :string(255)      default(""), not null
#  status      :string(255)      default(""), not null
#  created_at  :datetime
#  updated_at  :datetime
#  photo       :string(255)      default(""), not null
#

class Event < ActiveRecord::Base

	# If the event is destroyed, then all attendees to that event should be destroyed too.
	has_many :attendees, dependent: :destroy
	has_many :users, :through => :attendee
	has_many :attendees, dependent: :destroy
	has_many :skills, :through => :attendee

	validates :name, length: { maximum: 25 } 

	default_scope order: 'events.name ASC'

	#Add carrierwave for event Profiile Pictures.
	mount_uploader :photo, PhotoUploader	

	def is_attendee?(current_user)
		self.attendees.where('user_id = ?', current_user.id.to_s).any?
	end

	def attend_event(current_user)
		self.attendees.create!(user_id: current_user.id)
	end

	def unattend(current_user)

	end

end
