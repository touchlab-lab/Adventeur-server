class Checkpoint < ActiveRecord::Base
  belongs_to :venues
  belongs_to :adventure
end
