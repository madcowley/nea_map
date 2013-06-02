class Venue < ActiveRecord::Base
  attr_accessible :activity_type_id, :address1, :address2, :city, :event_year, 
                  :facility_type_id, :grant_num, :grantee, :latitude, :longitude, 
                  :name, :nea_venue_id, :state, :venue_type_id, :zip, :activity_type, :venue_type
  belongs_to :activity_type
  belongs_to :venue_type

  reverse_geocoded_by :latitude, :longitude

end
