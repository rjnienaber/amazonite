module Amazonite::DynamoDBV2
  # Represents the output of a `DescribeLimits` operation.
  class DescribeLimitsOutput
    include JSON::Serializable

    # The maximum total read capacity units that your account allows you to provision across all of
    # your tables in this Region.
    @[JSON::Field(key: "AccountMaxReadCapacityUnits")]
    property account_max_read_capacity_units : Int64 | Nil

    # The maximum total write capacity units that your account allows you to provision across all of
    # your tables in this Region.
    @[JSON::Field(key: "AccountMaxWriteCapacityUnits")]
    property account_max_write_capacity_units : Int64 | Nil

    # The maximum read capacity units that your account allows you to provision for a new table that
    # you are creating in this Region, including the read capacity units provisioned for its global
    # secondary indexes (GSIs).
    @[JSON::Field(key: "TableMaxReadCapacityUnits")]
    property table_max_read_capacity_units : Int64 | Nil

    # The maximum write capacity units that your account allows you to provision for a new table that
    # you are creating in this Region, including the write capacity units provisioned for its global
    # secondary indexes (GSIs).
    @[JSON::Field(key: "TableMaxWriteCapacityUnits")]
    property table_max_write_capacity_units : Int64 | Nil

    def initialize(
      @account_max_read_capacity_units : Int64 | Nil = nil,
      @account_max_write_capacity_units : Int64 | Nil = nil,
      @table_max_read_capacity_units : Int64 | Nil = nil,
      @table_max_write_capacity_units : Int64 | Nil = nil,
    )
    end
  end
end
