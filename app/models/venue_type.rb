class VenueType < ActiveRecord::Base
  attr_accessible :name
  has_many :venues
end
