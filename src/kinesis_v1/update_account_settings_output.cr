private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  class UpdateAccountSettingsOutput
    include JSON::Serializable

    # The updated configuration of the minimum throughput billing commitment for your account.
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
