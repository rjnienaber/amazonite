private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Response to a `GetFunctionConfiguration` request.
  class ImageConfigResponse
    include JSON::Serializable

    # Configuration values that override the container image Dockerfile.
    @[JSON::Field(key: "ImageConfig")]
    property image_config : ImageConfig | Nil

    # Error response to `GetFunctionConfiguration`.
    @[JSON::Field(key: "Error")]
    property error : ImageConfigError | Nil

    def initialize(
      @image_config : ImageConfig | Nil = nil,
      @error : ImageConfigError | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @image_config
        value.validate!
      end

      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@image_config, @error)
  end
end
