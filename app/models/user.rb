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
	validates	:name, presence: true, length: {in: 3..25}
	validates 	:description, length: {maximum: 255}


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :omniauthable, :omniauth_providers => [:twitter]
	has_many :skills
	has_many :attendees
	has_many :events, :through => :attendees
	has_many :tags, :as => :tagable

	before_save :ensure_authentication_token # Im not sure what this does anymore.

	mount_uploader :photo, PhotoUploader

	include PgSearch

	pg_search_scope :skill_search,
	using: {tsearch: {dictionary: "english"}},
	associated_against: {skills: {:name => 'A'}}

	def self.skill_match(current_user)
		skills_learn = current_user.skills.where(teach: false).pluck(:name).join(" ")
		#skills_learn = current_user.skills.pluck(:name).join(" ")

		skill_search(skills_learn)
	end

	# Only twitter is set up at the moment
	def self.from_omniauth(auth)
		where(auth.slice(:provider,:uid)).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.email = auth.info.email
			user.name = auth.info.name			# Save the Name.
			user.photo = auth.info.image		# Save the profile picture too.
		end
	end

	def self.new_with_session(params, session)
		if session["devise.user_attributes"]
			new(session["devise.user_attributes"]) do |user|
				user.attributes = params
				user.valid?
			end
		else
			super
		end
	end

	def password_required?
		super && provider.blank?
	end


end
