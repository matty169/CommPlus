# == Schema Information
#
# Table name: tags
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  tagable_id   :integer
#  tagable_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Tag < ActiveRecord::Base
	belongs_to :tagable, :polymorphic => true
end
