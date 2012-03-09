collection @checkpoints
attributes :id, :tout, :description, :position
child(:venue) { attributes :id, :latitude, :longitude, :name, :address }
child(:adventure) do
  attributes :id, :name, :description
  child(:checkpoints) do
    attributes :id, :tout, :description, :position
    child(:venue){ attributes :id,:latitude, :longitude, :name, :address }
  end
end

