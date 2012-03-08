require 'spec_helper'

describe Api::V1::SearchController do
  describe "POST 'nearest'" do
    describe "success" do
      it "should render a json response" do
        load "#{Rails.root}/db/seeds.rb"  
        post :nearest, :search => {'lat' => '40.725932', 'lng' => '-73.987787', 'radius' => '20'}, :format => :json
        resp = JSON.parse(response.body)
        STDERR.puts response.body
        resp["auth_token"].should_not == nil
      end
    end 
  end
end