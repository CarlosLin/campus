class Category < ActiveRecord::Base
  resourcify
  has_many :auctions, through: :groups
  validates_uniqueness_of :category_name
end
