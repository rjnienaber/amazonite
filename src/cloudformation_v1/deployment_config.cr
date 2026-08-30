private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The deployment configuration for a stack operation, including the deployment mode.
  class DeploymentConfig
    # Specifies the deployment mode for the stack operation. Possible values are:
    #
    # - `STANDARD` - Use the standard deployment behavior, ensuring resources are ready to serve
    # traffic before completing the operation. This is the default. You do not need to specify this
    # value explicitly.
    #
    # - `EXPRESS` - Complete the stack operation when resource configuration is applied, without
    # waiting for resources to become ready to serve traffic. Resources continue becoming ready in the
    # background.
    property mode : DeploymentConfigMode | Nil

    # Specifies whether to disable rollback of the stack if the stack operation fails.
    #
    # Default: `false`
    property disable_rollback : Bool | Nil

    def initialize(
      @mode : DeploymentConfigMode | Nil = nil,
      @disable_rollback : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @mode
        params << {"#{prefix}Mode", value.to_json_object_key}
      end

      if value = @disable_rollback
        params << {"#{prefix}DisableRollback", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        mode: (n = node.xpath_node("*[local-name()='Mode']")) ? ACF::DeploymentConfigMode.from_json_object_key?(n.content) : nil,
        disable_rollback: Core::XMLValue.bool(node.xpath_node("*[local-name()='DisableRollback']")),
      )
    end
  end
end
