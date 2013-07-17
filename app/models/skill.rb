# == Schema Information
#
# Table name: skills
#
#  id          :integer          not null, primary key
#  teach       :boolean
#  name        :string(255)
#  description :string(255)
#  numb_events :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Skill < ActiveRecord::Base
	belongs_to :user
end
