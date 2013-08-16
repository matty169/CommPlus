# == Schema Information
#
# Table name: attendees
#
#  id         :integer          not null, primary key
#  event_id   :string(255)
#  user_id    :string(255)
#  skill_id   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  teach      :boolean          default(FALSE), not null
#

class Attendee < ActiveRecord::Base
	belongs_to :user
	belongs_to :event
	belongs_to :skill
	
	validates :user, presence: true
	validates :event, presence: true
	# Take this away for now
	#validates :skill, presence: true

end
