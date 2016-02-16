class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :image
      t.string :image
      t.string :auction_id
      t.timestamps null: false
      t.timestamps null: false
    end
  end
end
