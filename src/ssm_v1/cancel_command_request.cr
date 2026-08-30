private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class CancelCommandRequest
    include JSON::Serializable

    # The ID of the command you want to cancel.
    @[JSON::Field(key: "CommandId")]
    property command_id : String

    # (Optional) A list of managed node IDs on which you want to cancel the command. If not provided,
    # the command is canceled on every node on which it was requested.
    @[JSON::Field(key: "InstanceIds")]
    property instance_ids : Array(String) | Nil

    def initialize(
      @command_id : String,
      @instance_ids : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @command_id
        raise Core::ValidationError.new("CommandId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("CommandId length must be <= 36") if value.size > 36
      end

      if value = @instance_ids
        raise Core::ValidationError.new("InstanceIds must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("InstanceIds must have at most 50 item(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@command_id, @instance_ids)
  end
end
