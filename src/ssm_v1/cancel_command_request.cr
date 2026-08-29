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
  end
end
