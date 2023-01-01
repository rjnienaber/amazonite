module Amazonite::SsmV1
  class GetCommandInvocationRequest
    include JSON::Serializable

    @[JSON::Field(key: "CommandId")]
    property command_id : String

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    @[JSON::Field(key: "PluginName")]
    property plugin_name : String | Nil

    def initialize(
      @command_id : String,
      @instance_id : String,
      @plugin_name : String | Nil = nil
    )
    end
  end
end
