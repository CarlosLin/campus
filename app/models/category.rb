class Category < ActiveRecord::Base
  resourcify
  has_many :auctions, through: :groups
  validates_uniqueness_of :category_name
  scope :parent_id, -> {where("parent_id = -1")}
end
