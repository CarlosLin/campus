class School < ActiveRecord::Base
  has_many :users, inverse_of: :school
end
