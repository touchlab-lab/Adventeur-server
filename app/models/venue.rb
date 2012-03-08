class Venue < ActiveRecord::Base
  has_many :checkpoints
#  acts_as_mappable :default_units => :miles, 
 #                  :default_formula => :sphere, 
  #                 :distance_field_name => :distance,
   #                :lat_column_name => :latitude,
    #               :lng_column_name => :longitude
  
  def self.fetch_and_add!(id)
    response = HTTParty.get("https://api.foursquare.com/v2/venues/#{id}?client_id=#{Adventeur::Application.config.foursquare_id}&client_secret=#{Adventeur::Application.config.foursquare_secret}")
    json = JSON.parse(response.body)
    if (json["meta"]["code"] != 200)
      return false
    end
    
    name = json["response"]["venue"]["name"]
    address = json["response"]["venue"]["location"]["address"]
    latitude = json["response"]["venue"]["location"]["lat"]
    longitude = json["response"]["venue"]["location"]["lng"]
    Venue.create!({:name => name, :address => address, :latitude => latitude, :longitude => longitude})
    
  end
end
