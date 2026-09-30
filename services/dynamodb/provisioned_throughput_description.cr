private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Represents the provisioned throughput settings for the table, consisting of read and write
  # capacity units, along with data about increases and decreases.
  class ProvisionedThroughputDescription
    include JSON::Serializable

    # The date and time of the last provisioned throughput increase for this table.
    @[JSON::Field(key: "LastIncreaseDateTime", converter: Core::AWSEpochConverter)]
    property last_increase_date_time : Time | Nil

    # The date and time of the last provisioned throughput decrease for this table.
    @[JSON::Field(key: "LastDecreaseDateTime", converter: Core::AWSEpochConverter)]
    property last_decrease_date_time : Time | Nil

    # The number of provisioned throughput decreases for this table during this UTC calendar day. For
    # current maximums on provisioned throughput decreases, see [Service, Account, and Table
    # Quotas](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html) in the
    # *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "NumberOfDecreasesToday")]
    property number_of_decreases_today : Int64 | Nil

    # The maximum number of strongly consistent reads consumed per second before DynamoDB returns a
    # `ThrottlingException`. Eventually consistent reads require less effort than strongly consistent
    # reads, so a setting of 50 `ReadCapacityUnits` per second provides 100 eventually consistent
    # `ReadCapacityUnits` per second.
    #
    # For a table or global secondary index that uses on-demand capacity mode (`PAY_PER_REQUEST`),
    # this value is `0`, because on-demand mode does not use provisioned throughput.
    @[JSON::Field(key: "ReadCapacityUnits")]
    property read_capacity_units : Int64 | Nil

    # The maximum number of writes consumed per second before DynamoDB returns a
    # `ThrottlingException`.
    #
    # For a table or global secondary index that uses on-demand capacity mode (`PAY_PER_REQUEST`),
    # this value is `0`, because on-demand mode does not use provisioned throughput.
    @[JSON::Field(key: "WriteCapacityUnits")]
    property write_capacity_units : Int64 | Nil

    def initialize(
      @last_increase_date_time : Time | Nil = nil,
      @last_decrease_date_time : Time | Nil = nil,
      @number_of_decreases_today : Int64 | Nil = nil,
      @read_capacity_units : Int64 | Nil = nil,
      @write_capacity_units : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @number_of_decreases_today
        raise Core::ValidationError.new("NumberOfDecreasesToday value must be >= 1") if value < 1
      end

      if value = @read_capacity_units
        raise Core::ValidationError.new("ReadCapacityUnits value must be >= 0") if value < 0
      end

      if value = @write_capacity_units
        raise Core::ValidationError.new("WriteCapacityUnits value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@last_increase_date_time, @last_decrease_date_time, @number_of_decreases_today, @read_capacity_units, @write_capacity_units)
  end
end
