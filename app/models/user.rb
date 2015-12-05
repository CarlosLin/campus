class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  has_many :messages
  has_many :posts
  has_many :schools
  validates_numericality_of :school_id, :only_integer => true
end
