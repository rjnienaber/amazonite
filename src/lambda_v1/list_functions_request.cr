private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class ListFunctionsRequest
    include JSON::Serializable

    @[JSON::Field(key: "MasterRegion", ignore: true)]
    property master_region : String | Nil

    @[JSON::Field(key: "FunctionVersion", converter: AL::FunctionVersion, ignore: true)]
    property function_version : FunctionVersion | Nil

    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @master_region : String | Nil = nil,
      @function_version : FunctionVersion | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end
  end
end
