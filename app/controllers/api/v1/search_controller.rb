class Api::V1::SearchController < ActionController::Base
  
  respond_to :json
  
  def nearest
    @checkpoints = Checkpoint.start.near( [params["search"]["lat"].to_f,params["search"]["lng"].to_f],params["search"]["radius"] ).limit(3)
    render 'api/v1/search'
  end
  
  def intersect
    @checkpoints = Checkpoint.where(:venue_id => params["search"]["venue_id"]).limit(3)
    render 'api/v1/search'
    
  end
  
  
end