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
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :skills
	has_many :attendees
	has_many :events, :through => :attendees
	has_many :tags, :as => :tagable
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

	include PgSearch

	pg_search_scope :skill_search,
	using: {tsearch: {dictionary: "english"}},
	associated_against: {skills: {:name => 'A'}}

	def self.skill_match(current_user)
		skills_learn = current_user.skills.where(teach: false).pluck(:name).join(" ")
		#skills_learn = current_user.skills.pluck(:name).join(" ")

		skill_search(skills_learn)
	end

end
