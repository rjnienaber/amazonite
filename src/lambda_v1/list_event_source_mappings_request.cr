module Amazonite::LambdaV1
  class ListEventSourceMappingsRequest
    include JSON::Serializable

    @[JSON::Field(key: "EventSourceArn", ignore: true)]
    property event_source_arn : String | Nil

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String | Nil

    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @event_source_arn : String | Nil = nil,
      @function_name : String | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end
  end
end
