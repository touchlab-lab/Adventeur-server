class Checkin < ActiveRecord::Base
  belongs_to :activity
  belongs_to :checkpoint
  belongs_to :user
  belongs_to :venue
  
  def foursq_checkin
    token = self.user.foursq_token
    v_id = self.venue.foursquare_id
    response = HTTParty.post("https://api.foursquare.com/v2/checkins/add?oauth_token=#{token}&venueId=#{v_id}")
    json = JSON.parse(response.body)
    if (json["meta"]["code"] != 200)
      return nil
    end
    return (json)
  end
end
