private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ResourceIdentifierSummary
    property resource_type : String | Nil

    property logical_resource_ids : Array(String) | Nil

    property resource_identifiers : Array(String) | Nil

    def initialize(
      @resource_type : String | Nil = nil,
      @logical_resource_ids : Array(String) | Nil = nil,
      @resource_identifiers : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_type
        params << {"#{prefix}ResourceType", value}
      end

      (@logical_resource_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}LogicalResourceIds.member.#{i}", item}
      end

      (@resource_identifiers || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ResourceIdentifiers.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")),
        logical_resource_ids: node.xpath_nodes("*[local-name()='LogicalResourceIds']/*[local-name()='member']").map { |n| n.content },
        resource_identifiers: node.xpath_nodes("*[local-name()='ResourceIdentifiers']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
