class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  has_many :messages
  has_many :posts
  has_many :favorites, inverse_of: :user
  has_many :schools
  validates :schools ,presence: true
end
