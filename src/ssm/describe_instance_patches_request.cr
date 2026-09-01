private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DescribeInstancePatchesRequest
    include JSON::Serializable

    # The ID of the managed node whose patch state information should be retrieved.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    # Each element in the array is a structure containing a key-value pair.
    #
    # Supported keys for `DescribeInstancePatches`include the following:
    #
    # - ** `Classification` **
    #
    # Sample values: `Security` | `SecurityUpdates`
    #
    # - ** `KBId` **
    #
    # Sample values: `KB4480056` | `java-1.7.0-openjdk.x86_64`
    #
    # - ** `Severity` **
    #
    # Sample values: `Important` | `Medium` | `Low`
    #
    # - ** `State` **
    #
    # Sample values: `Installed` | `InstalledOther` | `InstalledPendingReboot`
    #
    # For lists of all `State` values, see [Patch compliance state
    # values](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-compliance-states.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "Filters")]
    property filters : Array(PatchOrchestratorFilter) | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of patches to return (per page).
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @instance_id : String,
      @filters : Array(PatchOrchestratorFilter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @instance_id
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^i-(\\w{8}|\\w{17})$)|(^mi-\\w{17}$)$"))
      end

      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Filters must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 10") if value < 10
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@instance_id, @filters, @next_token, @max_results)
  end
end
