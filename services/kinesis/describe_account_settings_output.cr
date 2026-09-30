private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class DescribeAccountSettingsOutput
    include JSON::Serializable

    # The current configuration of the minimum throughput billing commitment for your Amazon Web
    # Services account.
    @[JSON::Field(key: "MinimumThroughputBillingCommitment")]
    property minimum_throughput_billing_commitment : MinimumThroughputBillingCommitmentOutput | Nil

    def initialize(
      @minimum_throughput_billing_commitment : MinimumThroughputBillingCommitmentOutput | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @minimum_throughput_billing_commitment
        value.validate!
      end
    end

    def_equals_and_hash(@minimum_throughput_billing_commitment)
  end
end
