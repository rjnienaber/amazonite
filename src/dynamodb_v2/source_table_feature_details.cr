module Amazonite::DynamoDBv2
  class SourceTableFeatureDetails
    include JSON::Serializable

    @[JSON::Field(key: "LocalSecondaryIndexes")]
    property local_secondary_indexes : Array(LocalSecondaryIndexInfo) | Nil

    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Array(GlobalSecondaryIndexInfo) | Nil

    @[JSON::Field(key: "StreamDescription")]
    property stream_description : StreamSpecification | Nil

    @[JSON::Field(key: "TimeToLiveDescription")]
    property time_to_live_description : TimeToLiveDescription | Nil

    @[JSON::Field(key: "SSEDescription")]
    property ssedescription : SSEDescription | Nil

    def initialize(
      @local_secondary_indexes : Array(LocalSecondaryIndexInfo) | Nil = nil,
      @global_secondary_indexes : Array(GlobalSecondaryIndexInfo) | Nil = nil,
      @stream_description : StreamSpecification | Nil = nil,
      @time_to_live_description : TimeToLiveDescription | Nil = nil,
      @ssedescription : SSEDescription | Nil = nil
    )
    end
  end
end