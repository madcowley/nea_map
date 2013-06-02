require 'csv'
namespace :maintenance do

 # create_table "grantees", :force => true do |t|
 #    t.string   "grant_num"
 #    t.integer  "fiscal_year"
 #    t.integer  "nea_office_id"
 #    t.string   "grantee_name"
 #    t.string   "url"
 #    t.string   "address1"
 #    t.string   "address2"
 #    t.string   "city"
 #    t.string   "state"
 #    t.string   "zip"
 #    t.string   "latitude"
 #    t.string   "longitude"
 #    t.datetime "created_at",    :null => false
 #    t.datetime "updated_at",    :null => false
 #  end

  #NEA_GrantNumber,NEA_FiscalYear,NEA_Office,NEA_Grantee,NEA_GranteeWebsite,
  # NEA_GranteeAddressLine1,NEA_GranteeAddressLine2,NEA_GranteeCity,NEA_GranteeState,
  # NEA_GranteeZipcode,NEA_GranteeLatitude,NEA_GranteeLongitude

  task :import_grantees => :environment do
    Grantee.destroy_all
    filename = File.expand_path('/Users/matt/Documents/dev/civic_hackathon2013/NEA/May13-HackDayChallenge_GranteeLocations.csv', __FILE__)
    file = File.new(filename, 'r')
    puts "reading..."
    first = true
    index = 1
    file.each_line("\n") do |row|
      unless first #skip first line
        begin
          columns = row.force_encoding('MacRoman').encode('UTF-8').parse_csv(:quote_char => '"')
          nea_office = NeaOffice.find_or_create_by_name(columns[2])
          grantee = Grantee.create!(:grant_num => columns[0],
                                    :fiscal_year => columns[1],
                                    :nea_office => nea_office,
                                    :grantee_name => columns[3],
                                    :url => columns[4],
                                    :address1 => columns[5],
                                    :address2 => columns[6],
                                    :city => columns[7],
                                    :state => columns[8],
                                    :zip => columns[9],
                                    :latitude => columns[10],
                                    :longitude => columns[11])
          #puts "added grantee #{grantee.grantee_name}"
        rescue
          puts "could not import line #{index}"
        end
      end
      index = index + 1
      first = false
    end
  end

  task :import_venues => :environment do
    Venue.destroy_all
    filename = File.expand_path('/Users/matt/Documents/dev/civic_hackathon2013/NEA/May13-HackDayChallenge_VenueLocations/venues.csv', __FILE__)
    file = File.new(filename, 'r')
    puts "reading..."
    first = true
    index = 0
    file.each_line("\n") do |row|
      unless first #skip first line
        #NEA_GrantNumber,EventYear,ActivityDescription,VenueTypeDescription,VenueName,VenueStreet1,VenueStreet2,
        #VenueCity,VenueState,VenueZip,VenueID,VenueLatitude,VenueLongitude,NEA_Grantee,FacilityType

        columns = row.force_encoding('MacRoman').encode('UTF-8').parse_csv(:quote_char => '"')
        activity_type = ActivityType.find_or_create_by_name(columns[2])
        venue_type = VenueType.find_or_create_by_name(columns[3])
        begin
          venue = Venue.create!(:grant_num => columns[0],
                                :event_year => columns[1],
                                :activity_type => activity_type,
                                :venue_type => venue_type,
                                :name => columns[4],
                                :address1 => columns[5],
                                :address2 => columns[6],
                                :city => columns[7],
                                :state => columns[8],
                                :zip => columns[9],
                                :nea_venue_id => columns[10],
                                :latitude => columns[11],
                                :longitude => columns[12],
                                :grantee => columns[13],
                                :facility_type_id => columns[14]
                                )
          puts "added venue #{venue.name}"
        rescue
          puts "could not import line #{index}"
        end
      end
      first = false
      index = index + 1
    end

  end
end
    # t.string   "grant_num"
    # t.integer  "event_year"
    # t.integer  "activity_type_id"
    # t.integer  "venue_type_id"
    # t.string   "name"
    # t.string   "address1"
    # t.string   "address2"
    # t.string   "city"
    # t.string   "state"
    # t.string   "zip"
    # t.integer  "nea_venue_id"
    # t.string   "latitude"
    # t.string   "longitude"
    # t.string   "grantee"
    # t.integer  "facility_type_id"
    # t.datetime "created_at",       :null => false
    # t.datetime "updated_at",       :null => false
