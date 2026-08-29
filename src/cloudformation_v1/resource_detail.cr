private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ResourceDetail
    property resource_type : String | Nil

    property logical_resource_id : String | Nil

    property resource_identifier : Hash(String, String) | Nil

    property resource_status : GeneratedTemplateResourceStatus | Nil

    property resource_status_reason : String | Nil

    property warnings : Array(WarningDetail) | Nil

    def initialize(
      @resource_type : String | Nil = nil,
      @logical_resource_id : String | Nil = nil,
      @resource_identifier : Hash(String, String) | Nil = nil,
      @resource_status : GeneratedTemplateResourceStatus | Nil = nil,
      @resource_status_reason : String | Nil = nil,
      @warnings : Array(WarningDetail) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_type
        params << {"#{prefix}ResourceType", value}
      end

      if value = @logical_resource_id
        params << {"#{prefix}LogicalResourceId", value}
      end

      (@resource_identifier || {} of String => String).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}ResourceIdentifier.entry.#{i}.key", key}
        params << {"#{prefix}ResourceIdentifier.entry.#{i}.value", value}
      end

      if value = @resource_status
        params << {"#{prefix}ResourceStatus", value.to_json_object_key}
      end

      if value = @resource_status_reason
        params << {"#{prefix}ResourceStatusReason", value}
      end

      (@warnings || [] of WarningDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Warnings.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")),
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")),
        resource_identifier: node.xpath_nodes("*[local-name()='ResourceIdentifier']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
        resource_status: (n = node.xpath_node("*[local-name()='ResourceStatus']")) ? ACF::GeneratedTemplateResourceStatus.from_json_object_key?(n.content) : nil,
        resource_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceStatusReason']")),
        warnings: node.xpath_nodes("*[local-name()='Warnings']/*[local-name()='member']").map { |n| WarningDetail.from_xml(n) },
      )
    end
  end
end
