private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # Represents an individual contributor to a multi-timeseries alarm, containing information about a
  # specific time series and its contribution to the alarm's state.
  class AlarmContributor
    include JSON::Serializable

    # The unique identifier for this alarm contributor.
    @[JSON::Field(key: "ContributorId")]
    property contributor_id : String

    # A map of attributes that describe the contributor, such as metric dimensions and other
    # identifying characteristics.
    @[JSON::Field(key: "ContributorAttributes")]
    property contributor_attributes : Hash(String, String)

    # An explanation for the contributor's current state, providing context about why it is in its
    # current condition.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String

    # The timestamp when the contributor last transitioned to its current state.
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
