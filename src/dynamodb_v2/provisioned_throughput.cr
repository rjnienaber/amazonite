module Amazonite::DynamoDBV2
  # Represents the provisioned throughput settings for the specified global secondary index. You
  # must use `ProvisionedThroughput` or `OnDemandThroughput` based on your table’s capacity mode.
  #
  # For current minimum and maximum provisioned throughput values, see [Service, Account, and Table
  # Quotas](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html) in the
  # *Amazon DynamoDB Developer Guide*.
  class ProvisionedThroughput
    include JSON::Serializable

    # The maximum number of strongly consistent reads consumed per second before DynamoDB returns a
    # `ThrottlingException`. For more information, see [Specifying Read and Write
    # Requirements](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughput.html)
    # in the *Amazon DynamoDB Developer Guide*.
    #
    # If read/write capacity mode is `PAY_PER_REQUEST` the value is set to 0.
    @[JSON::Field(key: "ReadCapacityUnits")]
    property read_capacity_units : Int64

    # The maximum number of writes consumed per second before DynamoDB returns a
    # `ThrottlingException`. For more information, see [Specifying Read and Write
    # Requirements](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughput.html)
    # in the *Amazon DynamoDB Developer Guide*.
    #
    # If read/write capacity mode is `PAY_PER_REQUEST` the value is set to 0.
    @[JSON::Field(key: "WriteCapacityUnits")]
    property write_capacity_units : Int64

    def initialize(
      @read_capacity_units : Int64,
      @write_capacity_units : Int64,
    )
    end

    def_equals_and_hash(@read_capacity_units, @write_capacity_units)
  end
end
