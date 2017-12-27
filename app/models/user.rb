class User < ApplicationRecord
  extend Devise::Models
  after_create :build_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  validates :first_name, presence: true

  has_one :profile
  has_many :posts
  has_many :photos

  has_many :comments, foreign_key: :author_id, dependent: :destroy

  has_many :likes
  
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"
  
  has_many :active_friends, -> {where(friendships: { accepted: true})}, through: :friendships, source: :friend
  has_many :received_friends, -> {where(friendships: { accepted: true})}, through: :received_friendships, source: :user
  
  has_many :pending_friends, -> {where(friendships: { accepted: false})}, through: :friendships, source: :friend
  has_many :requested_friends, -> {where(friendships: { accepted: false})}, through: :received_friendships, source: :user

  accepts_nested_attributes_for :profile, :allow_destroy => true
  
  def friends
  	active_friends | received_friends
  end

  def pending
  	pending_friends | requested_friends
  end

  def feed
  	posts
  end

  def build_profile
    Profile.create(user: self)
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
  end

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
  end
end



end
