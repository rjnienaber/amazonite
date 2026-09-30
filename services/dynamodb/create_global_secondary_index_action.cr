private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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

    def validate! : Nil
      if value = @index_name
        raise Core::ValidationError.new("IndexName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("IndexName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("IndexName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @key_schema
        raise Core::ValidationError.new("KeySchema must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end

      if value = @projection
        value.validate!
      end

      if value = @provisioned_throughput
        value.validate!
      end

      if value = @on_demand_throughput
        value.validate!
      end

      if value = @warm_throughput
        value.validate!
      end
    end

    def_equals_and_hash(@index_name, @key_schema, @projection, @provisioned_throughput, @on_demand_throughput, @warm_throughput)
  end
end
