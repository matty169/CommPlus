# == Schema Information
#
# Table name: skills
#
#  id          :integer          not null, primary key
#  teach       :boolean          default(FALSE)
#  name        :string(255)      default(""), not null
#  description :string(255)      default(""), not null
#  numb_events :integer          default(0)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Skill < ActiveRecord::Base
	belongs_to :user
	has_many :attendees, dependent: :destroy
	has_many :events, :through => :attendee
	has_many :tags, :as => :tagable, dependent: :destroy

	validates :name, presence: true, length: {maximum: 25}
	validates :description, length: {maximum: 255}

	default_scope order: 'skills.name ASC'

	include PgSearch
	# add some weightings.
	# has root stemming
	# would like trigram search and double metaphone search
	pg_search_scope :search, :against => {:name =>'A'},
	using: {tsearch: {dictionary: "english", prefix: true, any_word: true}},
	associated_against: {tags: {:name =>'B'}}

	pg_search_scope :search_offer, :against => {:name =>'A'},
	using: {tsearch: {dictionary: "english", prefix: true, any_word: true}}

	def self.skill_match(current_user)
		learn_string = current_user.skills.where("teach = ?", false).pluck(:name).join(" ")
		users = search(learn_string)
	end

	def self.skill_recommend(current_user)
		users = skill_match(current_user)
		offer_string = current_user.skills.where("teach = ?", true).pluck(:name).join(" ")
		users.search("prog")
	end

	def self.skill_search(query, current_user, teach)
		if query.present?
			users = search(query)
			users = users.where("teach = ? and user_id != ?", teach, current_user.id)

			users
		else
			where("teach = ? and user_id != ?", teach, current_user.id)		
		end
	end
end
