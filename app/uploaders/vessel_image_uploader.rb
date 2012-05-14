# encoding: utf-8
class VesselImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file

  version :thumb do
    process :resize_to_fill => [330, 230, ::Magick::NorthGravity]
  end

  version :mini do
    process :resize_to_fill => [150, 100, ::Magick::NorthGravity]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end