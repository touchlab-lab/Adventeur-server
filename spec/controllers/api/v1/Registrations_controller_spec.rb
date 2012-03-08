require 'spec_helper'
require 'fakeweb'

FakeWeb.allow_net_connect = false

describe Api::V1::RegistrationsController do
  describe "POST 'create'" do
    describe "success" do
      it "should render the correct json response" do
        # users endpoint uris
        FakeWeb.register_uri(:get, 'https://api.foursquare.com/v2/users/self?oauth_token=aaaa',
                         :response => File.expand_path('spec/faker/fake_user.json'))
        post :create, :oauth => {'foursq' => 'aaaa'}, :format => :json
        resp = JSON.parse(response.body)
        resp["auth_token"].should_not == nil
      end
    end 
  end
end