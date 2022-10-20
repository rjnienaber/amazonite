module Amazonite::DynamoDBv2
  class DescribeLimitsOutput
    include JSON::Serializable

    @[JSON::Field(key: "AccountMaxReadCapacityUnits")]
    property account_max_read_capacity_units : Int64 | Nil

    @[JSON::Field(key: "AccountMaxWriteCapacityUnits")]
    property account_max_write_capacity_units : Int64 | Nil

    @[JSON::Field(key: "TableMaxReadCapacityUnits")]
    property table_max_read_capacity_units : Int64 | Nil

    @[JSON::Field(key: "TableMaxWriteCapacityUnits")]
    property table_max_write_capacity_units : Int64 | Nil

    def initialize(
      @account_max_read_capacity_units : Int64 | Nil = nil,
      @account_max_write_capacity_units : Int64 | Nil = nil,
      @table_max_read_capacity_units : Int64 | Nil = nil,
      @table_max_write_capacity_units : Int64 | Nil = nil
    )
    end
  end
end