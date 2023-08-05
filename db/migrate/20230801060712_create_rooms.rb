class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.text :body
      t.integer :price
      t.string :address
      t.string :image

      t.timestamps
    end
  end
end
