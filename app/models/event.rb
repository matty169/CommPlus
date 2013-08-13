# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)      default(""), not null
#  date        :date
#  time        :time
#  location    :string(255)      default(""), not null
#  description :string(255)      default(""), not null
#  host_id     :integer
#  photo_url   :string(255)
#  status      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
	has_many :attendees, dependent: :destroy
	has_many :users, :through => :attendee
	has_many :attendees, dependent: :destroy
	has_many :skills, :through => :attendee

	validates :name, length: { maximum: 25 } 

	default_scope order: 'events.name ASC'
end
