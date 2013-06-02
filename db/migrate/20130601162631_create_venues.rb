class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :grant_num
      t.integer :event_year
      t.integer :activity_type_id
      t.integer :venue_type_id
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :nea_venue_id
      t.string :latitude
      t.string :longitude
      t.string :grantee
      t.integer :facility_type_id

      t.timestamps
    end
  end
end
