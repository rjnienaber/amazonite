module Amazonite::KinesisV1
  class UpdateAccountSettingsInput
    include JSON::Serializable

    # Specifies the minimum throughput billing commitment configuration for your account.
    @[JSON::Field(key: "MinimumThroughputBillingCommitment")]
    property minimum_throughput_billing_commitment : MinimumThroughputBillingCommitmentInput

    def initialize(
      @minimum_throughput_billing_commitment : MinimumThroughputBillingCommitmentInput,
    )
    end
  end
end
