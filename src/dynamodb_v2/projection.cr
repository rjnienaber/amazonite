private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents attributes that are copied (projected) from the table into an index. These are in
  # addition to the primary key attributes and index key attributes, which are automatically
  # projected.
  class Projection
    include JSON::Serializable

    # The set of attributes that are projected into the index:
    #
    # - `KEYS_ONLY` - Only the index and primary keys are projected into the index.
    #
    # - `INCLUDE` - In addition to the attributes described in `KEYS_ONLY`, the secondary index will
    # include other non-key attributes that you specify.
    #
    # - `ALL` - All of the table attributes are projected into the index.
    #
    # When using the DynamoDB console, `ALL` is selected by default.
    @[JSON::Field(key: "ProjectionType", converter: ADDB::ProjectionType)]
    property projection_type : ProjectionType | Nil

    # Represents the non-key attribute names which will be projected into the index.
    #
    # For global and local secondary indexes, the total count of `NonKeyAttributes` summed across all
    # of the secondary indexes, must not exceed 100. If you project the same attribute into two
    # different indexes, this counts as two distinct attributes when determining the total. This limit
    # only applies when you specify the ProjectionType of `INCLUDE`. You still can specify the
    # ProjectionType of `ALL` to project all attributes from the source table, even if the table has
    # more than 100 attributes.
    @[JSON::Field(key: "NonKeyAttributes")]
    property non_key_attributes : Array(String) | Nil

    def initialize(
      @projection_type : ProjectionType | Nil = nil,
      @non_key_attributes : Array(String) | Nil = nil,
    )
    end
  end
end
