module Amazonite::LambdaV1
  class ImageConfigResponse
    include JSON::Serializable

    @[JSON::Field(key: "ImageConfig")]
    property image_config : ImageConfig | Nil

    @[JSON::Field(key: "Error")]
    property error : ImageConfigError | Nil

    def initialize(
      @image_config : ImageConfig | Nil = nil,
      @error : ImageConfigError | Nil = nil,
    )
    end
  end
end
