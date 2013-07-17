# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  rating      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class User < ActiveRecord::Base
	has_many :skills
	has_many :attendees
	has_many :events, :through => :attendees
end
