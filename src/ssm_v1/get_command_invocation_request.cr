module Amazonite::SsmV1
  class GetCommandInvocationRequest
    include JSON::Serializable

    # (Required) The parent command ID of the invocation plugin.
    @[JSON::Field(key: "CommandId")]
    property command_id : String

    # (Required) The ID of the managed node targeted by the command. A *managed node* can be an Amazon
    # Elastic Compute Cloud (Amazon EC2) instance, edge device, and on-premises server or VM in your
    # hybrid environment that is configured for Amazon Web Services Systems Manager.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    # The name of the step for which you want detailed results. If the document contains only one
    # step, you can omit the name and details for that step. If the document contains more than one
    # step, you must specify the name of the step for which you want to view details. Be sure to
    # specify the name of the step, not the name of a plugin like `aws:RunShellScript`.
    #
    # To find the `PluginName`, check the document content and find the name of the step you want
    # details for. Alternatively, use ListCommandInvocations with the `CommandId` and `Details`
    # parameters. The `PluginName` is the `Name` attribute of the `CommandPlugin` object in the
    # `CommandPlugins` list.
    @[JSON::Field(key: "PluginName")]
    property plugin_name : String | Nil

    def initialize(
      @command_id : String,
      @instance_id : String,
      @plugin_name : String | Nil = nil,
    )
    end

    def_equals_and_hash(@command_id, @instance_id, @plugin_name)
  end
end
