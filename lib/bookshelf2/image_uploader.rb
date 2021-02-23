require 'shrine'
require 'shrine/storage/file_system'
require "image_processing/mini_magick"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new(Dir.tmpdir),
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads")
}

class ImageUploader < Shrine
  # include ImageProcessing::MiniMagick
  plugin :derivatives
  # plugin :processing
  plugin :versions   # enable Shrine to handle a hash of files
  plugin :delete_raw # delete processed files after uploading
  plugin :column
  plugin :entity
  plugin :rack_file
  plugin :restore_cached_data
  plugin :sequel
  plugin :cached_attachment_data
  plugin :add_metadata
  plugin :validation

 
  Attacher.derivatives do |original|
    binding.pry
    # magick = ImageProcessing::MiniMagick.source(original)
 
    # { 
    #   large:  magick.resize_to_limit!(800, 800),
    #   medium: magick.resize_to_limit!(500, 500),
    #   small:  magick.resize_to_limit!(300, 300),
    # }
  end

    Attacher.validate do
      binding.pry
    end

  # process(:store) do |io, context|
  #   original = io.download
  #   binding.pry
  #   # size_800 = resize_to_limit!(original, 800, 800)
  #   # size_500 = resize_to_limit(size_800,  500, 500)
  #   # size_300 = resize_to_limit(size_500,  300, 300)

  #   # {original: io, large: size_800, medium: size_500, small: size_300}
  #   versions = {original: io}
  # end
end