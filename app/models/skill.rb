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
	has_many :attendees
	has_many :events, :through => :attendee
	has_many :tags, :as => :tagable

	include PgSearch
	# add some weightings.
	pg_search_scope :search, :against => {:name =>'A'},
	using: {tsearch: {dictionary: "english"}},
	associated_against: {tags: {:name =>'B'}}

	def self.text_search(query)
		if query.present?
			search(query)
			## This is without the gem
			# rank = <<-RANK
			# 	ts_rank(to_tsvector(name), plaintti_tsquery(#{sanitize(query)}))
			# RANK
			# where("name @@ :q", q: query)
			## Old code
			#find(:all, :conditions => ['name ilike ?', "%#{query}%"])
		else
			find(:all)
		end
	end
end
