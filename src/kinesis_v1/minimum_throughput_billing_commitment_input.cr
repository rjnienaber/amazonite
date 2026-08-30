private alias AK = Amazonite::KinesisV1

module Amazonite::KinesisV1
  # Represents the request parameters for configuring minimum throughput billing commitment.
  #
  # - Minimum throughput billing commitments provide cost savings on on-demand data streams in
  # exchange for committing to a minimum level of throughput usage.
  #
  # - Commitments have a minimum duration of 24 hours that must be honored before they can be
  # disabled.
  #
  # - If you attempt to disable a commitment before the minimum commitment period ends, the
  # commitment will be scheduled for automatic disable at the earliest allowed end time.
  #
  # - You can cancel a pending disable by enabling the commitment again before the earliest allowed
  # end time.
  class MinimumThroughputBillingCommitmentInput
    include JSON::Serializable

    # The desired status of the minimum throughput billing commitment.
    @[JSON::Field(key: "Status", converter: AK::MinimumThroughputBillingCommitmentInputStatus)]
    property status : MinimumThroughputBillingCommitmentInputStatus

    def initialize(
      @status : MinimumThroughputBillingCommitmentInputStatus,
    )
    end
  end
end
