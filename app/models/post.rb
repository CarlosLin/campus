class Post < ActiveRecord::Base
  acts_as_punchable
  has_many :favorites, :as => :favoritable
  has_many :messages, :inverse_of => :post
  belongs_to :user
  belongs_to :type, :inverse_of => :posts
  has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
