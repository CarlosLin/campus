class Category < ActiveRecord::Base
  resourcify
  has_many :auctions
  validates_uniqueness_of :category_name
  scope :roots, -> {where("parent_id = -1")}
  # scope :sub_categories, -> (id) { where("parent_id = ?", id) }
  # 
  def self.sub_categories
    if Category.where("parent_id = ?", :id) 
      return Category.all
    end
  end

  # def self.is_root?(category)
  #   return category.parent_id == -1
  # end

  # def self.roots
  #   return Category.where(:parent_id => -1)
  # end
end
