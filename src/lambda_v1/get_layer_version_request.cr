module Amazonite::LambdaV1
  class GetLayerVersionRequest
    include JSON::Serializable

    # The name or Amazon Resource Name (ARN) of the layer.
    @[JSON::Field(key: "LayerName", ignore: true)]
    property layer_name : String = ""

    # The version number.
    @[JSON::Field(key: "VersionNumber", ignore: true)]
    property version_number : Int64 = 0

    def initialize(
      @layer_name : String,
      @version_number : Int64,
    )
    end
  end
end
