class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :content
      t.integer :user_id
      t.integer :location_id
      t.datetime :date

      t.timestamps
    end
  end
end
