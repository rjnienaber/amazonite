private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class SignalResourceInput
    property stack_name : String

    property logical_resource_id : String

    property unique_id : String

    property status : ResourceSignalStatus

    def initialize(
      @stack_name : String,
      @logical_resource_id : String,
      @unique_id : String,
      @status : ResourceSignalStatus,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      params << {"#{prefix}LogicalResourceId", @logical_resource_id}

      params << {"#{prefix}UniqueId", @unique_id}

      params << {"#{prefix}Status", @status.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")).not_nil!,
        unique_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UniqueId']")).not_nil!,
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? ACF::ResourceSignalStatus.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end
  end
end
