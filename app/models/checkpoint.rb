class Checkpoint < ActiveRecord::Base
  belongs_to :venue
  belongs_to :adventure
end
