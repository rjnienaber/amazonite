module Amazonite::EventBridgeV1
  # This parameter contains the criteria (either InstanceIds or a tag) used to specify which EC2
  # instances are to be sent the command.
  class RunCommandParameters
    include JSON::Serializable

    # Currently, we support including only one RunCommandTarget block, which specifies either an array
    # of InstanceIds or a tag.
    @[JSON::Field(key: "RunCommandTargets")]
    property run_command_targets : Array(RunCommandTarget) = [] of RunCommandTarget

    def initialize(
      @run_command_targets : Array(RunCommandTarget),
    )
    end

    def_equals_and_hash(@run_command_targets)
  end
end
