require "image_processing/mini_magick"

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :processing
  plugin :versions
  plugin :delete_raw

  process(:store) do |io, context|
    original = io.download
    size_1000 = resize_to_limit!(original, 1000, 1000)
    size_300 = resize_to_limit(size_1000,  300, 300)
    {original: io, large: size_1000, small: size_300}
  end
end
