class Api::V1::RegistrationsController < ActionController::Base
  
  respond_to :json
  
  def create
    STDERR.puts "params: '" + params.inspect + "'"
    STDERR.puts "params: '" + params.to_json + "'"
    STDERR.puts "request" + request.env.inspect
    oauth = params['oauth']
    if (!oauth['foursq'].nil?)
      user = User.find_foursq_user(oauth['foursq'])
      if (!user.nil?)
        user.ensure_authentication_token!
        render :json=> {:success=>true, :auth_token=>user.authentication_token}
      else
        render :json=> {:success=>false, :error => "unable to find user on foursquare"}
      end
      
    end
  end
  
end