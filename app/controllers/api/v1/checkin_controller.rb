class Api::V1::CheckinController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]
  
  respond_to :json
  def create
    STDERR.puts "params: '" + params.inspect + "'"
    @checkin = current_user.checkins.build(params[:checkin])
    
    if (@checkin.save!)
      foursq_resp = @checkin.foursq_checkin
      render json: {:checkin => @checkin, :foursq_resp => foursq_resp}, status: :created 
    else
      render json: @checkin.errors, status: :unprocessable_entity
    end
      
  end
  
end
