class Adventure < ActiveRecord::Base
  has_many :checkpoints
  belongs_to :user
end
