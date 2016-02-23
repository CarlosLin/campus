class AddGroupIdToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :group_id, :integer
  end
end
