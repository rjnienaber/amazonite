private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @instance_patch_states
        raise Core::ValidationError.new("InstancePatchStates must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("InstancePatchStates must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_patch_states, @next_token)
  end
end
