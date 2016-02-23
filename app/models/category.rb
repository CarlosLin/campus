class Category < ActiveRecord::Base
  has_many :groups
  has_many :auctions, through: :groups
end
