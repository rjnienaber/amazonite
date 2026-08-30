module Amazonite::KinesisV1
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
  end
end
