class AddCategoryInAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :category_id, :integer, null: false
  end
end
