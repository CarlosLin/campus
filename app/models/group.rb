class Group < ActiveRecord::Base
  belongs_to :auction
  belongs_to :category
end
