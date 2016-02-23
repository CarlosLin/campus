class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :auction_id
      t.integer :category_id
      t.string :categorized

      t.timestamps null: false
    end
  end
end
