class Category < ActiveRecord::Base
  resourcify
  has_many :groups
  has_many :auctions, through: :groups
end
