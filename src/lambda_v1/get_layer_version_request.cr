module Amazonite::LambdaV1
  class GetLayerVersionRequest
    include JSON::Serializable

    @[JSON::Field(key: "LayerName", ignore: true)]
    property layer_name : String = ""

    @[JSON::Field(key: "VersionNumber", ignore: true)]
    property version_number : Int64 = 0

    def initialize(
      @layer_name : String,
      @version_number : Int64,
    )
    end
  end
end
