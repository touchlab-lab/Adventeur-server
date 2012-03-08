class Checkpoint < ActiveRecord::Base
  belongs_to :venue # :as => :locatable 
  belongs_to :adventure
  reverse_geocoded_by :latitude, :longitude
  scope :start, where(:position => 1)
  acts_as_list :scope => :adventure
 # acts_as_mappable :through => :venue
  
end
