class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :longitude
      t.string :latitude
      t.string :location

      t.timestamps
    end
  end
end
