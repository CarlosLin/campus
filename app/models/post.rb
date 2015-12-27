require 'uri'
class Post < ActiveRecord::Base
  resourcify
  include Bootsy::Container
  acts_as_punchable
  has_many :favorites, :as => :favoritable
  has_many :messages, :inverse_of => :post
  belongs_to :user
  belongs_to :type, :inverse_of => :posts
  has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  def self.sample_cover_img(post)
    cover = URI.extract(post.content, ['http','https'])
    post.cover_image = cover.sample
  end
end
