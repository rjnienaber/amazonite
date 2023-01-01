module Amazonite::SsmV1
  class DescribeInstancePatchStatesForPatchGroupResult
    include JSON::Serializable

    @[JSON::Field(key: "InstancePatchStates")]
    property instance_patch_states : Array(InstancePatchState) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @instance_patch_states : Array(InstancePatchState) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
