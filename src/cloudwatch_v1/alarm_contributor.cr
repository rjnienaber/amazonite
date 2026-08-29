private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class AlarmContributor
    include JSON::Serializable

    @[JSON::Field(key: "ContributorId")]
    property contributor_id : String

    @[JSON::Field(key: "ContributorAttributes")]
    property contributor_attributes : Hash(String, String)

    @[JSON::Field(key: "StateReason")]
    property state_reason : String

    @[JSON::Field(key: "StateTransitionedTimestamp", converter: Core::AWSEpochConverter)]
    property state_transitioned_timestamp : Time | Nil

    def initialize(
      @contributor_id : String,
      @contributor_attributes : Hash(String, String),
      @state_reason : String,
      @state_transitioned_timestamp : Time | Nil = nil,
    )
    end
  end
end
