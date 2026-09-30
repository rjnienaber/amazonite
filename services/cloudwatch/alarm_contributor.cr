private alias Core = Amazonite::Core

module Amazonite::CloudWatch
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

    def validate! : Nil
      if value = @contributor_id
        raise Core::ValidationError.new("ContributorId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ContributorId length must be <= 16") if value.size > 16
      end

      if value = @contributor_attributes
        raise Core::ValidationError.new("ContributorAttributes must have at least 0 entry(s)") if value.size < 0
        raise Core::ValidationError.new("ContributorAttributes must have at most 150 entry(s)") if value.size > 150
      end

      if value = @state_reason
        raise Core::ValidationError.new("StateReason length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StateReason length must be <= 1023") if value.size > 1023
      end
    end

    def_equals_and_hash(@contributor_id, @contributor_attributes, @state_reason, @state_transitioned_timestamp)
  end
end
