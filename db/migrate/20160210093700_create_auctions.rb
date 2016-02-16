class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :item_name, null: false
      t.integer :price, null: false
      t.float :shipping_price
      t.integer :quantity, null: false
      t.text :narrative
      t.timestamps null: false
    end
  end
end
