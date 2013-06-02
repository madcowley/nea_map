class Grantee < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :fiscal_year, :grant_num, :grantee_name, :latitude, 
                  :longitude, :nea_office_id, :state, :url, :zip, :nea_office
  belongs_to :nea_office

  reverse_geocoded_by :latitude, :longitude

end
