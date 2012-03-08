class Adventure < ActiveRecord::Base
  has_many :checkpoints, :order => "position"
  belongs_to :user
  has_many :checkins
  
end
