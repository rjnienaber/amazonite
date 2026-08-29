module Amazonite::SsmV1
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
  end
end
