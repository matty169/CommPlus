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

require 'spec_helper'

describe User do

  before { @user = User.new( email: "looi.matthew1@gmail.com", password: "password", password_confirmation: "password") }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it "has a default rating of zero" do
    @user.rating.should == 0
  end

  it "has a default name that is not null" do
    @user.name.should_not eq nil
  end

  it "has a default desciption that is not null" do
    @user.description.should_not eq nil
  end

  it "has a default location that is not null" do
    @user.location.should_not eq nil
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "with a password that's just right" do
    before { @user.password = @user.password_confirmation = "a" * 50 }
    it { should be_valid }
  end

  describe "with a password that's too long" do
    before { @user.password = @user.password_confirmation = "a" * 130 }
    it { should be_invalid }
  end

   describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "with a email with a space" do
    before { @user.email = @user.email = "example @gmail.com" }
    it { should be_invalid }
  end

  describe "with a email without an @" do
    before { @user.email = @user.email = "example.gmail.com" }
    it { should be_invalid }
  end

  describe "with a email with an funny character" do
    before { @user.email = @user.email = "ex*am/ple@gmail.com" }
    it { should be_invalid }
  end

  describe "when email is not present" do
    before do
      @user = User.new( email: "", password: "password", password_confirmation: "password")
    end
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new( email: "user@example.com", password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password does not match" do
  	before { @user = User.new( email: "user@example.com", password: "password", password_confirmation: "pass" ) }
  	it { should_not be_valid }
  end

  
end
