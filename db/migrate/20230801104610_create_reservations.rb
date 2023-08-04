class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :room_name
      t.integer :people
      t.datetime :start_date
      t.datetime :end_date
      t.integer :room_id
      t.integer :user_id
      
      t.timestamps
    end
  end
end
