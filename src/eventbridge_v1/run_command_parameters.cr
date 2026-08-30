private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @run_command_targets
        raise Core::ValidationError.new("RunCommandTargets must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("RunCommandTargets must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@run_command_targets)
  end
end
