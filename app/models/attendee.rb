# == Schema Information
#
# Table name: attendees
#
#  id             :integer          not null, primary key
#  event_id       :string(255)
#  user_id_string :string(255)
#  skill_id       :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Attendee < ActiveRecord::Base
	belongs_to :user
	belongs_to :event
	has_one :skill
end
