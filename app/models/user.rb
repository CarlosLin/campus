class User < ActiveRecord::Base
  rolify
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :rememberable, :trackable, :validatable,
    :omniauthable, :omniauth_providers => [:facebook]
  has_many :messages
  has_many :posts
  has_many :favorites, inverse_of: :user
  # has_many :posts, :foreign_key => :favoritable_id, :class_name => 'Favorite', :source => 'Post', :condition => ['favoritable_type=Post']
  belongs_to :school, inverse_of: :users
  validates_numericality_of :school_id, :only_integer => true
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.school_id = 1
    end
  end
  def assign_default_role
    add_role(:member) if self.roles.blank?
  end
end
