private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Defines a filter used in Patch Manager APIs. Supported filter keys depend on the API operation
  # that includes the filter. Patch Manager API operations that use `PatchOrchestratorFilter`
  # include the following:
  #
  # - DescribeAvailablePatches
  #
  # - DescribeInstancePatches
  #
  # - DescribePatchBaselines
  #
  # - DescribePatchGroups
  class PatchOrchestratorFilter
    include JSON::Serializable

    # The key for the filter.
    @[JSON::Field(key: "Key")]
    property key : String | Nil

    # The value for the filter.
    @[JSON::Field(key: "Values")]
    property values : Array(String) | Nil

    def initialize(
      @key : String | Nil = nil,
      @values : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@key, @values)
  end
end
