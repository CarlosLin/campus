class Type < ActiveRecord::Base
  has_many :posts, :inverse_of => :type
  def name
  	"#{type_name}"
  end
end
