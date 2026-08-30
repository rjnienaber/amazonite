module Amazonite::SsmV1
  class DescribeInstancePatchStatesForPatchGroupResult
    include JSON::Serializable

    # The high-level patch state for the requested managed nodes.
    @[JSON::Field(key: "InstancePatchStates")]
    property instance_patch_states : Array(InstancePatchState) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @instance_patch_states : Array(InstancePatchState) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@instance_patch_states, @next_token)
  end
end
