# encoding: utf-8
class PageImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file

  version :normal do
    process :resize_to_fill => [652, 471, ::Magick::NorthGravity]
  end

  version :small do
    process :resize_to_fill => [210, 310, ::Magick::NorthGravity]
  end

  version :mini do
    process :resize_to_fill => [150, 100, ::Magick::NorthGravity]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
