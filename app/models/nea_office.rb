class NeaOffice < ActiveRecord::Base
  attr_accessible :name
  has_many :grantees
end
