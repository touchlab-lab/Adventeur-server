class Venue < ActiveRecord::Base
  has_many :checkpoints
  
  def self.fetch_and_add!(id)
    response = HTTParty.get("https://api.foursquare.com/v2/venues/#{id}?client_id=#{Adventeur::Application.config.foursquare_id}&client_secret=#{Adventeur::Application.config.foursquare_secret}")
    json = JSON.parse(response.body)
    if (json["meta"]["code"] != 200)
      return false
    end
    
    name = json["response"]["venue"]["name"]
    address = json["response"]["venue"]["address"]
    latitude = json["response"]["venue"]["location"]["lat"]
    longitude = json["response"]["venue"]["location"]["lng"]
    Venue.create!({:name => name, :address => address, :latitude => latitude, :longitude => longitude})
    
  end
end
