class Auction < ActiveRecord::Base
  belongs_to :user
  has_many :photos, dependent: :destroy
  def editable_by?(current_user)
    current_user == user
  end
end
