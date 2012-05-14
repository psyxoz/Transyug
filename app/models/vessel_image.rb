class VesselImage < ActiveRecord::Base
  attr_accessible :file, :vessel_id, :sort_id
  mount_uploader :file, VesselImageUploader
  belongs_to :vessel
end
