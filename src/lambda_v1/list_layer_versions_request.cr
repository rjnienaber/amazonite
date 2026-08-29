private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class ListLayerVersionsRequest
    include JSON::Serializable

    @[JSON::Field(key: "CompatibleArchitecture", converter: AL::Architecture, ignore: true)]
    property compatible_architecture : Architecture | Nil

    @[JSON::Field(key: "CompatibleRuntime", converter: AL::Runtime, ignore: true)]
    property compatible_runtime : Runtime | Nil

    @[JSON::Field(key: "LayerName", ignore: true)]
    property layer_name : String = ""

    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @layer_name : String,
      @compatible_architecture : Architecture | Nil = nil,
      @compatible_runtime : Runtime | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end
  end
end
