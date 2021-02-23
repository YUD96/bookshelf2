require_relative '../image_uploader'


class Image < Hanami::Entity
  include ImageUploader::Attachment(:image)
end
