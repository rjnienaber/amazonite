private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an instance to export.
  class InstanceExportDetails
    # The ID of the resource being exported.
    property instance_id : String | Nil

    # The target virtualization environment.
    property target_environment : ExportEnvironment | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @target_environment : ExportEnvironment | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @target_environment
        params << {"#{prefix}TargetEnvironment", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        target_environment: (n = node.xpath_node("*[local-name()='targetEnvironment']")) ? AEC::ExportEnvironment.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @target_environment)
  end
end
