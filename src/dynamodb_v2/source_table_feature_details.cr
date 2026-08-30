module Amazonite::DynamoDBV2
  # Contains the details of the features enabled on the table when the backup was created. For
  # example, LSIs, GSIs, streams, TTL.
  class SourceTableFeatureDetails
    include JSON::Serializable

    # Represents the LSI properties for the table when the backup was created. It includes the
    # IndexName, KeySchema and Projection for the LSIs on the table at the time of backup.
    @[JSON::Field(key: "LocalSecondaryIndexes")]
    property local_secondary_indexes : Array(LocalSecondaryIndexInfo) | Nil

    # Represents the GSI properties for the table when the backup was created. It includes the
    # IndexName, KeySchema, Projection, and ProvisionedThroughput for the GSIs on the table at the
    # time of backup.
    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Array(GlobalSecondaryIndexInfo) | Nil

    # Stream settings on the table when the backup was created.
    @[JSON::Field(key: "StreamDescription")]
    property stream_description : StreamSpecification | Nil

    # Time to Live settings on the table when the backup was created.
    @[JSON::Field(key: "TimeToLiveDescription")]
    property time_to_live_description : TimeToLiveDescription | Nil

    # The description of the server-side encryption status on the table when the backup was created.
    @[JSON::Field(key: "SSEDescription")]
    property sse_description : SSEDescription | Nil

    # The vector index properties for the table at the time the backup was created, including the
    # index name, vector attribute, dimensions, distance function, search schema, and projection.
    @[JSON::Field(key: "VectorIndexes")]
    property vector_indexes : Array(VectorIndexInfo) | Nil

    def initialize(
      @local_secondary_indexes : Array(LocalSecondaryIndexInfo) | Nil = nil,
      @global_secondary_indexes : Array(GlobalSecondaryIndexInfo) | Nil = nil,
      @stream_description : StreamSpecification | Nil = nil,
      @time_to_live_description : TimeToLiveDescription | Nil = nil,
      @sse_description : SSEDescription | Nil = nil,
      @vector_indexes : Array(VectorIndexInfo) | Nil = nil,
    )
    end

    def_equals_and_hash(@local_secondary_indexes, @global_secondary_indexes, @stream_description, @time_to_live_description, @sse_description, @vector_indexes)
  end
end
