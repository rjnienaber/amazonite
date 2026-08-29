module Amazonite::LambdaV1
  class ListCodeSigningConfigsRequest
    include JSON::Serializable

    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end
  end
end
