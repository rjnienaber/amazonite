private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Defines a filter used in DescribeInstancePatchStatesForPatchGroup to scope down the information
  # returned by the API.
  #
  # **Example**: To filter for all managed nodes in a patch group having more than three patches
  # with a `FailedCount` status, use the following for the filter:
  #
  # - Value for `Key`: `FailedCount`
  #
  # - Value for `Type`: `GreaterThan`
  #
  # - Value for `Values`: `3`
  class InstancePatchStateFilter
    include JSON::Serializable

    # The key for the filter. Supported values include the following:
    #
    # - `InstalledCount`
    #
    # - `InstalledOtherCount`
    #
    # - `InstalledPendingRebootCount`
    #
    # - `InstalledRejectedCount`
    #
    # - `MissingCount`
    #
    # - `FailedCount`
    #
    # - `UnreportedNotApplicableCount`
    #
    # - `NotApplicableCount`
    @[JSON::Field(key: "Key")]
    property key : String

    # The value for the filter. Must be an integer greater than or equal to 0.
    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    # The type of comparison that should be performed for the value.
    @[JSON::Field(key: "Type", converter: AS::InstancePatchStateOperatorType)]
    property type : InstancePatchStateOperatorType

    def initialize(
      @key : String,
      @values : Array(String),
      @type : InstancePatchStateOperatorType,
    )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 200") if value.size > 200
      end

      if value = @values
        raise Core::ValidationError.new("Values must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Values must have at most 1 item(s)") if value.size > 1
      end
    end

    def_equals_and_hash(@key, @values, @type)
  end
end
