private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class StreamSpecification
    include JSON::Serializable

    @[JSON::Field(key: "StreamEnabled")]
    property stream_enabled : Bool

    @[JSON::Field(key: "StreamViewType", converter: ADDB::StreamViewType)]
    property stream_view_type : StreamViewType | Nil

    def initialize(
      @stream_enabled : Bool,
      @stream_view_type : StreamViewType | Nil = nil
    )
    end
  end
end
