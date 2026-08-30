module Amazonite::DynamoDBV2
  # Represents a new global secondary index to be added to an existing table.
  class CreateGlobalSecondaryIndexAction
    include JSON::Serializable

    # The name of the global secondary index to be created.
    @[JSON::Field(key: "IndexName")]
    property index_name : String

    # The key schema for the global secondary index. Global secondary index supports up to 4 partition
    # and up to 4 sort keys.
    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement) = [] of KeySchemaElement

    # Represents attributes that are copied (projected) from the table into an index. These are in
    # addition to the primary key attributes and index key attributes, which are automatically
    # projected.
    @[JSON::Field(key: "Projection")]
    property projection : Projection

    # Represents the provisioned throughput settings for the specified global secondary index.
    #
    # For current minimum and maximum provisioned throughput values, see [Service, Account, and Table
    # Quotas](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html) in the
    # *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput | Nil

    # The maximum number of read and write units for the global secondary index being created. If you
    # use this parameter, you must specify `MaxReadRequestUnits`, `MaxWriteRequestUnits`, or both. You
    # must use either `OnDemand Throughput` or `ProvisionedThroughput` based on your table's capacity
    # mode.
    @[JSON::Field(key: "OnDemandThroughput")]
    property on_demand_throughput : OnDemandThroughput | Nil

    # Represents the warm throughput value (in read units per second and write units per second) when
    # creating a secondary index.
    @[JSON::Field(key: "WarmThroughput")]
    property warm_throughput : WarmThroughput | Nil

    def initialize(
      @index_name : String,
      @key_schema : Array(KeySchemaElement),
      @projection : Projection,
      @provisioned_throughput : ProvisionedThroughput | Nil = nil,
      @on_demand_throughput : OnDemandThroughput | Nil = nil,
      @warm_throughput : WarmThroughput | Nil = nil,
    )
    end
  end
end
