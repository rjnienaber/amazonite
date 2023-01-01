module Amazonite::SsmV1
  class CancelCommandRequest
    include JSON::Serializable

    @[JSON::Field(key: "CommandId")]
    property command_id : String

    @[JSON::Field(key: "InstanceIds")]
    property instance_ids : Array(String) | Nil

    def initialize(
      @command_id : String,
      @instance_ids : Array(String) | Nil = nil
    )
    end
  end
end
