private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ScannedResource
    property resource_type : String | Nil

    property resource_identifier : Hash(String, String) | Nil

    property managed_by_stack : Bool | Nil

    def initialize(
      @resource_type : String | Nil = nil,
      @resource_identifier : Hash(String, String) | Nil = nil,
      @managed_by_stack : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_type
        params << {"#{prefix}ResourceType", value}
      end

      (@resource_identifier || {} of String => String).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}ResourceIdentifier.entry.#{i}.key", key}
        params << {"#{prefix}ResourceIdentifier.entry.#{i}.value", value}
      end

      if value = @managed_by_stack
        params << {"#{prefix}ManagedByStack", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")),
        resource_identifier: node.xpath_nodes("*[local-name()='ResourceIdentifier']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
        managed_by_stack: Core::XMLValue.bool(node.xpath_node("*[local-name()='ManagedByStack']")),
      )
    end
  end
end
