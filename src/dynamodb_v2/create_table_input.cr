private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents the input of a `CreateTable` operation.
  class CreateTableInput
    include JSON::Serializable

    # An array of attributes that describe the key schema for the table and indexes.
    @[JSON::Field(key: "AttributeDefinitions")]
    property attribute_definitions : Array(AttributeDefinition) | Nil

    # The name of the table to create. You can also provide the Amazon Resource Name (ARN) of the
    # table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # Specifies the attributes that make up the primary key for a table or an index. The attributes in
    # `KeySchema` must also be defined in the `AttributeDefinitions` array. For more information, see
    # [Data Model](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html) in
    # the *Amazon DynamoDB Developer Guide*.
    #
    # Each `KeySchemaElement` in the array is composed of:
    #
    # - `AttributeName` - The name of this key attribute.
    #
    # - `KeyType` - The role that the key attribute will assume:
    #
    # - `HASH` - partition key
    #
    # - `RANGE` - sort key
    #
    # The partition key of an item is also known as its *hash attribute*. The term "hash attribute"
    # derives from the DynamoDB usage of an internal hash function to evenly distribute data items
    # across partitions, based on their partition key values.
    #
    # The sort key of an item is also known as its *range attribute*. The term "range attribute"
    # derives from the way DynamoDB stores items with the same partition key physically close
    # together, in sorted order by the sort key value.
    #
    # For a simple primary key (partition key), you must provide exactly one element with a `KeyType`
    # of `HASH`.
    #
    # For a composite primary key (partition key and sort key), you must provide exactly two elements,
    # in this order: The first element must have a `KeyType` of `HASH`, and the second element must
    # have a `KeyType` of `RANGE`.
    #
    # For more information, see [Working with
    # Tables](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#WorkingWithTables.primary.key)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement) | Nil

    # One or more local secondary indexes (the maximum is 5) to be created on the table. Each index is
    # scoped to a given partition key value. There is a 10 GB size limit per partition key value;
    # otherwise, the size of a local secondary index is unconstrained.
    #
    # Each local secondary index in the array includes the following:
    #
    # - `IndexName` - The name of the local secondary index. Must be unique only for this table.
    #
    # - `KeySchema` - Specifies the key schema for the local secondary index. The key schema must
    # begin with the same partition key as the table.
    #
    # - `Projection` - Specifies attributes that are copied (projected) from the table into the index.
    # These are in addition to the primary key attributes and index key attributes, which are
    # automatically projected. Each attribute specification is composed of:
    #
    # - `ProjectionType` - One of the following:
    #
    # - `KEYS_ONLY` - Only the index and primary keys are projected into the index.
    #
    # - `INCLUDE` - Only the specified table attributes are projected into the index. The list of
    # projected attributes is in `NonKeyAttributes`.
    #
    # - `ALL` - All of the table attributes are projected into the index.
    #
    # - `NonKeyAttributes` - A list of one or more non-key attribute names that are projected into the
    # secondary index. The total count of attributes provided in `NonKeyAttributes`, summed across all
    # of the secondary indexes, must not exceed 100. If you project the same attribute into two
    # different indexes, this counts as two distinct attributes when determining the total. This limit
    # only applies when you specify the ProjectionType of `INCLUDE`. You still can specify the
    # ProjectionType of `ALL` to project all attributes from the source table, even if the table has
    # more than 100 attributes.
    @[JSON::Field(key: "LocalSecondaryIndexes")]
    property local_secondary_indexes : Array(LocalSecondaryIndex) | Nil

    # One or more global secondary indexes (the maximum is 20) to be created on the table. Each global
    # secondary index in the array includes the following:
    #
    # - `IndexName` - The name of the global secondary index. Must be unique only for this table.
    #
    # - `KeySchema` - Specifies the key schema for the global secondary index. Each global secondary
    # index supports up to 4 partition keys and up to 4 sort keys.
    #
    # - `Projection` - Specifies attributes that are copied (projected) from the table into the index.
    # These are in addition to the primary key attributes and index key attributes, which are
    # automatically projected. Each attribute specification is composed of:
    #
    # - `ProjectionType` - One of the following:
    #
    # - `KEYS_ONLY` - Only the index and primary keys are projected into the index.
    #
    # - `INCLUDE` - Only the specified table attributes are projected into the index. The list of
    # projected attributes is in `NonKeyAttributes`.
    #
    # - `ALL` - All of the table attributes are projected into the index.
    #
    # - `NonKeyAttributes` - A list of one or more non-key attribute names that are projected into the
    # secondary index. The total count of attributes provided in `NonKeyAttributes`, summed across all
    # of the secondary indexes, must not exceed 100. If you project the same attribute into two
    # different indexes, this counts as two distinct attributes when determining the total. This limit
    # only applies when you specify the ProjectionType of `INCLUDE`. You still can specify the
    # ProjectionType of `ALL` to project all attributes from the source table, even if the table has
    # more than 100 attributes.
    #
    # - `ProvisionedThroughput` - The provisioned throughput settings for the global secondary index,
    # consisting of read and write capacity units.
    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Array(GlobalSecondaryIndex) | Nil

    # Controls how you are charged for read and write throughput and how you manage capacity. This
    # setting can be changed later.
    #
    # - `PAY_PER_REQUEST` - We recommend using `PAY_PER_REQUEST` for most DynamoDB workloads.
    # `PAY_PER_REQUEST` sets the billing mode to [On-demand capacity
    # mode](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/on-demand-capacity-mode.html).
    #
    # - `PROVISIONED` - We recommend using `PROVISIONED` for steady workloads with predictable growth
    # where capacity requirements can be reliably forecasted. `PROVISIONED` sets the billing mode to
    # [Provisioned capacity
    # mode](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html).
    @[JSON::Field(key: "BillingMode", converter: ADDB::BillingMode)]
    property billing_mode : BillingMode | Nil

    # Represents the provisioned throughput settings for a specified table or index. The settings can
    # be modified using the `UpdateTable` operation.
    #
    # If you set BillingMode as `PROVISIONED`, you must specify this property. If you set BillingMode
    # as `PAY_PER_REQUEST`, you cannot specify this property.
    #
    # For current minimum and maximum provisioned throughput values, see [Service, Account, and Table
    # Quotas](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html) in the
    # *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput | Nil

    # The settings for DynamoDB Streams on the table. These settings consist of:
    #
    # - `StreamEnabled` - Indicates whether DynamoDB Streams is to be enabled (true) or disabled
    # (false).
    #
    # - `StreamViewType` - When an item in the table is modified, `StreamViewType` determines what
    # information is written to the table's stream. Valid values for `StreamViewType` are:
    #
    # - `KEYS_ONLY` - Only the key attributes of the modified item are written to the stream.
    #
    # - `NEW_IMAGE` - The entire item, as it appears after it was modified, is written to the stream.
    #
    # - `OLD_IMAGE` - The entire item, as it appeared before it was modified, is written to the
    # stream.
    #
    # - `NEW_AND_OLD_IMAGES` - Both the new and the old item images of the item are written to the
    # stream.
    @[JSON::Field(key: "StreamSpecification")]
    property stream_specification : StreamSpecification | Nil

    # Represents the settings used to enable server-side encryption.
    @[JSON::Field(key: "SSESpecification")]
    property sse_specification : SSESpecification | Nil

    # A list of key-value pairs to label the table. For more information, see [Tagging for
    # DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html).
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # The table class of the new table. Valid values are `STANDARD` and `STANDARD_INFREQUENT_ACCESS`.
    @[JSON::Field(key: "TableClass", converter: ADDB::TableClass)]
    property table_class : TableClass | Nil

    # Indicates whether deletion protection is to be enabled (true) or disabled (false) on the table.
    @[JSON::Field(key: "DeletionProtectionEnabled")]
    property deletion_protection_enabled : Bool | Nil

    # Represents the warm throughput (in read units per second and write units per second) for
    # creating a table.
    @[JSON::Field(key: "WarmThroughput")]
    property warm_throughput : WarmThroughput | Nil

    # An Amazon Web Services resource-based policy document in JSON format that will be attached to
    # the table.
    #
    # When you attach a resource-based policy while creating a table, the policy application is
    # *strongly consistent*.
    #
    # The maximum size supported for a resource-based policy document is 20 KB. DynamoDB counts
    # whitespaces when calculating the size of a policy against this limit. For a full list of all
    # considerations that apply for resource-based policies, see [Resource-based policy
    # considerations](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/rbac-considerations.html).
    #
    # You need to specify the `CreateTable` and `PutResourcePolicy` IAM actions for authorizing a user
    # to create a table with a resource-based policy.
    @[JSON::Field(key: "ResourcePolicy")]
    property resource_policy : String | Nil

    # Sets the maximum number of read and write units for the specified table in on-demand capacity
    # mode. If you use this parameter, you must specify `MaxReadRequestUnits`, `MaxWriteRequestUnits`,
    # or both.
    @[JSON::Field(key: "OnDemandThroughput")]
    property on_demand_throughput : OnDemandThroughput | Nil

    # The Amazon Resource Name (ARN) of the source table used for the creation of a multi-account
    # global table.
    @[JSON::Field(key: "GlobalTableSourceArn")]
    property global_table_source_arn : String | Nil

    # Controls the settings synchronization mode for the global table. For multi-account global
    # tables, this parameter is required and the only supported value is ENABLED. For same-account
    # global tables, this parameter is set to ENABLED_WITH_OVERRIDES.
    @[JSON::Field(key: "GlobalTableSettingsReplicationMode", converter: ADDB::GlobalTableSettingsReplicationMode)]
    property global_table_settings_replication_mode : GlobalTableSettingsReplicationMode | Nil

    # One or more vector indexes to be created on the table. Each vector index enables similarity
    # search on a vector attribute. Each element in the list consists of:
    #
    # - `IndexName` - The name of the vector index. Must be unique within the table.
    #
    # - `VectorAttribute` - The attribute that contains vector embeddings. If multiple vector indexes
    # reference the same attribute, they must all use the same number of dimensions.
    #
    # - `Dimensions` - The number of dimensions in each vector.
    #
    # - `DistanceFunction` - The distance function used to calculate similarity. Valid values:
    # `COSINE`, `EUCLIDEAN`, `DOT_PRODUCT`.
    #
    # - `Projection` - Specifies attributes that are copied (projected) from the table into the vector
    # index. The total number of projected non-key attributes is shared across the vector attribute
    # (counts as 1) and `INLINE_FILTER` search schema elements (each counts as 1). `HASH` search
    # schema elements do not count toward this limit.
    #
    # - `SearchSchema` - (Optional) Defines the partition key (`HASH`) and inline filter
    # (`INLINE_FILTER`) attributes for the vector index.
    @[JSON::Field(key: "VectorIndexes")]
    property vector_indexes : Array(VectorIndex) | Nil

    def initialize(
      @table_name : String,
      @attribute_definitions : Array(AttributeDefinition) | Nil = nil,
      @key_schema : Array(KeySchemaElement) | Nil = nil,
      @local_secondary_indexes : Array(LocalSecondaryIndex) | Nil = nil,
      @global_secondary_indexes : Array(GlobalSecondaryIndex) | Nil = nil,
      @billing_mode : BillingMode | Nil = nil,
      @provisioned_throughput : ProvisionedThroughput | Nil = nil,
      @stream_specification : StreamSpecification | Nil = nil,
      @sse_specification : SSESpecification | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @table_class : TableClass | Nil = nil,
      @deletion_protection_enabled : Bool | Nil = nil,
      @warm_throughput : WarmThroughput | Nil = nil,
      @resource_policy : String | Nil = nil,
      @on_demand_throughput : OnDemandThroughput | Nil = nil,
      @global_table_source_arn : String | Nil = nil,
      @global_table_settings_replication_mode : GlobalTableSettingsReplicationMode | Nil = nil,
      @vector_indexes : Array(VectorIndex) | Nil = nil,
    )
    end
  end
end
