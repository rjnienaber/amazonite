private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Contains the details for the read/write capacity mode. This page talks about `PROVISIONED` and
  # `PAY_PER_REQUEST` billing modes. For more information about these modes, see [Read/write
  # capacity
  # mode](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html).
  #
  # You may need to switch to on-demand mode at least once in order to return a `BillingModeSummary`
  # response.
  class BillingModeSummary
    include JSON::Serializable

    # Controls how you are charged for read and write throughput and how you manage capacity. This
    # setting can be changed later.
    #
    # - `PROVISIONED` - Sets the read/write capacity mode to `PROVISIONED`. We recommend using
    # `PROVISIONED` for predictable workloads.
    #
    # - `PAY_PER_REQUEST` - Sets the read/write capacity mode to `PAY_PER_REQUEST`. We recommend using
    # `PAY_PER_REQUEST` for unpredictable workloads.
    @[JSON::Field(key: "BillingMode", converter: ADDB::BillingMode)]
    property billing_mode : BillingMode | Nil

    # Represents the time when `PAY_PER_REQUEST` was last set as the read/write capacity mode.
    @[JSON::Field(key: "LastUpdateToPayPerRequestDateTime", converter: Core::AWSEpochConverter)]
    property last_update_to_pay_per_request_date_time : Time | Nil

    def initialize(
      @billing_mode : BillingMode | Nil = nil,
      @last_update_to_pay_per_request_date_time : Time | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@billing_mode, @last_update_to_pay_per_request_date_time)
  end
end
