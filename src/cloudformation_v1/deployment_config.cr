private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DeploymentConfig
    property mode : DeploymentConfigMode | Nil

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
