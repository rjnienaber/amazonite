private alias AK = Amazonite::KinesisV1
private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  # Represents the current status of minimum throughput billing commitment for an account.
  class MinimumThroughputBillingCommitmentOutput
    include JSON::Serializable

    # The current status of the minimum throughput billing commitment.
    @[JSON::Field(key: "Status", converter: AK::MinimumThroughputBillingCommitmentOutputStatus)]
    property status : MinimumThroughputBillingCommitmentOutputStatus

    # The timestamp when the commitment was started.
    @[JSON::Field(key: "StartedAt", converter: Core::AWSEpochConverter)]
    property started_at : Time | Nil

    # The timestamp when the commitment was ended.
    @[JSON::Field(key: "EndedAt", converter: Core::AWSEpochConverter)]
    property ended_at : Time | Nil

    # The earliest timestamp when the commitment can be ended.
    @[JSON::Field(key: "EarliestAllowedEndAt", converter: Core::AWSEpochConverter)]
    property earliest_allowed_end_at : Time | Nil

    def initialize(
      @status : MinimumThroughputBillingCommitmentOutputStatus,
      @started_at : Time | Nil = nil,
      @ended_at : Time | Nil = nil,
      @earliest_allowed_end_at : Time | Nil = nil,
    )
    end
  end
end
