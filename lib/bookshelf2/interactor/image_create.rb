require 'hanami/interactor'
require 'hanami/validations'
require_relative '../image_uploader'

class ImageCreate
  class Validation
    include Hanami::Validations

    validations do
    required(:image) { filled? }
    end
  end

  include Hanami::Interactor

  expose :image

  def initialize(params)
    @params = params
  end

  def call
    file = @params[:image]
    image = Image.new
    attacher = ImageUploader::Attacher.from_entity(image, :image)
    attacher.assign(file)
    image_data = Image.new(image_data: attacher.column_data)
    @image = repo.create(image_data)
  end

  private

  def repo
    repo = ImageRepository.new()
  end

  def valid?
    @validate_result = Validation.new(@params).validate

    if @validate_result.failure?
      error(@validate_result.messages)
    end

    @validate_result.success?
  end
end
