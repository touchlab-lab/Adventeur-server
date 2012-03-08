class Api::V1::SearchController < ActionController::Base
  
  respond_to :json
  
  def nearest
    STDERR.puts params.inspect
    STDERR.puts params["search"].inspect
    @checkpoints = Checkpoint.start.near( [params["search"]["lat"].to_f,params["search"]["lng"].to_f],  20)
    render 'api/v1/search'
  end
  
  def intersect
    @checkpoints = Checkpoint.where(:venue_id => params["search"]["venue"]).limit(10)
    render 'api/v1/search'
    
  end
  
  
end