require 'spec_helper'

FakeWeb.allow_net_connect = false

describe Api::V1::CheckinController do
  describe "POST 'create'" do
    describe "success" do
      it "should render a json response" do
        load "#{Rails.root}/db/seeds.rb"  
       
        user = User.create!({:email => 'null@example.com', :password => "blahblah", :password_confirmation => "blahblah", :foursq_token => "ZJF4G5UFBRBYVA0TA2E2MNCACIOOIRXMG0GHZ5X5EIPPKNYT"})
        user.ensure_authentication_token!
        cp = Checkpoint.all.first()
        FakeWeb.register_uri(:post, "https://api.foursquare.com/v2/checkins/add?oauth_token=ZJF4G5UFBRBYVA0TA2E2MNCACIOOIRXMG0GHZ5X5EIPPKNYT&venueId=#{cp.venue.foursquare_id}",
                         :response => File.expand_path("spec/faker/fake_checkin.json"))
        
        post :create, {:checkin => {:checkpoint_id => cp.id, :adventure_id => cp.adventure_id, :venue_id => cp.venue_id }, :auth_token => user.authentication_token}, :format => :json
        resp = JSON.parse(response.body)
      end
    end 
  end
end