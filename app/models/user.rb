# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      default(""), not null
#  description            :string(255)      default(""), not null
#  rating                 :integer          default(0)
#  is_male                :boolean          default(TRUE)
#  location               :string(255)      default(""), not null
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  authentication_token   :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  photo                  :string(255)
#

class User < ActiveRecord::Base
  validates :name, length: {maximum: 25}
  validates :description, length: {maximum: 255}

  # The settings for devise on the class user.
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :token_authenticatable, :omniauthable, :omniauth_providers => [:twitter]
  # Im not sure what this does anymore.
  before_save :ensure_authentication_token

  has_many :skills, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :events, :through => :attendees
  has_many :tags, :as => :tagable, dependent: :destroy
  accepts_nested_attributes_for :skills, allow_destroy: true

  # Name of photo attriubute for cloudinary. Name of the cloudninary controller.
  mount_uploader :photo, PhotoUploader

  default_scope order: 'users.name ASC'

  # Setup for the full-text-search using Postgres.
  include PgSearch
  pg_search_scope :skill_search,
    using: {tsearch: {dictionary: "english"}},
    associated_against: {skills: {:name => 'A'}}


  def tag_string()
    tag_string = self.tags.pluck(:name).join("# ") 
  end

  def self.skill_match(current_user)
    # Create a string of all the skills.
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
      user.name = auth.info.name      # Save the Name.
      user.photo = auth.info.image    # Save the profile picture too.
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
