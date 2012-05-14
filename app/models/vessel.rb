class Vessel < ActiveRecord::Base
  attr_accessible :title_ru, :description_ru, :content_ru, :title_en, :description_en, :content_en,
                  :location, :archive, :sort_id, :pocket_plan, :featured, :images_attributes

  mount_uploader :pocket_plan, VesselImageUploader
  has_many  :images, :class_name => "VesselImage", :dependent => :destroy

  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => proc { |attr| attr['file'].blank? }
end
