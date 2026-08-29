private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ResourceDefinition
    property resource_type : String

    property logical_resource_id : String | Nil

    property resource_identifier : Hash(String, String)

    def initialize(
      @resource_type : String,
      @resource_identifier : Hash(String, String),
      @logical_resource_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ResourceType", @resource_type}

      if value = @logical_resource_id
        params << {"#{prefix}LogicalResourceId", value}
      end

      @resource_identifier.each_with_index(1) do |(key, value), i|
        params << {"#{prefix}ResourceIdentifier.entry.#{i}.key", key}
        params << {"#{prefix}ResourceIdentifier.entry.#{i}.value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")).not_nil!,
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")),
        resource_identifier: node.xpath_nodes("*[local-name()='ResourceIdentifier']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
      )
    end
  end
end
